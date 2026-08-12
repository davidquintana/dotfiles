#!/bin/sh
# Copy shared dotfiles into $HOME (or a destination directory).
# Usage: ./install.sh [destination]

set -e

case "${1-}" in
    -h|--help)
        echo "Usage: $0 [destination]"
        echo "Copy dotfiles into destination (default: \$HOME)."
        exit 0
        ;;
esac

REPO=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
DEST="${1:-$HOME}"
BACKUP="$DEST/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

if ! git -C "$REPO" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "error: $REPO is not a git checkout" >&2
    exit 1
fi

skip() {
    case "$1" in
        README.md|mac_apps|install.sh|.vim/.netrwhist) return 0 ;;
        *) return 1 ;;
    esac
}

backup() {
    dest="$1"
    rel="$2"
    mkdir -p "$BACKUP/$(dirname "$rel")"
    cp -p "$dest" "$BACKUP/$rel"
    echo "backup  $rel -> $BACKUP/$rel"
}

install_file() {
    rel="$1"
    src="$REPO/$rel"
    dest="$DEST/$rel"

    [ -f "$src" ] || return 0

    mkdir -p "$(dirname "$dest")"

    if [ -L "$dest" ]; then
        rm "$dest"
    fi

    if [ -f "$dest" ]; then
        if cmp -s "$src" "$dest"; then
            echo "skip    $rel"
            return 0
        fi
        backup "$dest" "$rel"
    fi

    cp -p "$src" "$dest"
    echo "copy    $rel"
}

{
    git -C "$REPO" ls-files
    [ -f "$REPO/.path" ] && echo ".path"
} | sort -u | while IFS= read -r rel; do
    [ -n "$rel" ] || continue
    skip "$rel" && continue
    install_file "$rel"
done

if [ -d "$BACKUP" ]; then
    echo "backups: $BACKUP"
fi
