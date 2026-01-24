#!/usr/bin/env python3
import sys
import json
import subprocess
import os

def main():
    # Read input from stdin
    try:
        data = json.load(sys.stdin)
    except json.JSONDecodeError:
        return # Exit silently if invalid input

    # 1. Extract Data with defaults (mimicking jq // values)
    model_data = data.get("model", {})
    cw_data = data.get("context_window", {})
    ws_data = data.get("workspace", {})

    model_name = model_data.get("display_name") or "Unknown"
    model_name = model_name.replace("Claude ", "")

    used_pct = cw_data.get("used_percentage") or 0
    tin = cw_data.get("total_input_tokens") or 0
    tout = cw_data.get("total_output_tokens") or 0
    total_tokens = tin + tout
    
    # Default 200k if missing
    size = cw_data.get("context_window_size") or 200000
    
    cwd = ws_data.get("current_dir") or "~"

    # 2. Math & Formatting
    tk = int(total_tokens / 1000)
    mk = int(size / 1000)
    filled_len = int(used_pct / 10)
    if filled_len > 10: filled_len = 10

    # 3. Build the Bar
    bar_str = ""
    for i in range(10):
        if i < filled_len:
            if i < 4:
                color = "\033[92m" # Green
            elif i < 6:
                color = "\033[93m" # Yellow
            else:
                color = "\033[91m" # Red
            bar_str += f"{color}=\033[0m"
        else:
            bar_str += " "

    # 4. Git Branch Check
    branch = "no-git"
    if cwd != "~" and os.path.exists(cwd):
        try:
            # Using standard git command from original script
            result = subprocess.run(
                ["git", "-C", cwd, "--no-optional-locks", "rev-parse", "--abbrev-ref", "HEAD"],
                capture_output=True,
                text=True,
                timeout=1 # Prevent hanging
            )
            if result.returncode == 0:
                branch = result.stdout.strip()
        except Exception:
            pass

    # 5. Final Output Construction
    # Model [Bar] Used% | Total/Max
    out = (
        f"\033[96m{model_name}\033[0m "
        f"[{bar_str}] "
        f"\033[93m{used_pct}%\033[0m"
        # f" | \033[92m{tk}k/{mk}k\033[0m"
    )

    # | Branch (optional)
    if branch:
        out += f" | \033[95m󰘬 {branch}\033[0m"

    # | Directory
    dirname = os.path.basename(cwd) if cwd != "~" else "~"
    out += f" | \033[96m{dirname}\033[0m"

    print(out)

if __name__ == "__main__":
    main()
