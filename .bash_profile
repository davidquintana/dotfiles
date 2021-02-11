# load .bashrc settings
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Homebrew paths
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# Golang paths
export GOPATH=$HOME/Developer/SDK/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Android
export ANDROID_HOME=/Users/jdq/Library/Android/sdk

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

# Silence Catalina zsh message
export BASH_SILENCE_DEPRECATION_WARNING=1

# The next line updates PATH for the Google Cloud SDK.
source '/Users/jdq/Developer/SDK/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/jdq/Developer/SDK/google-cloud-sdk/completion.bash.inc'
