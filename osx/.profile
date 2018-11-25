# MacPorts Installer addition on 2015-12-03_at_16:27:52: adding an appropriate PATH variable for use with MacPorts.
export PATH="$HOME/Library/Android/sdk/platform-tools/:$HOME/Library/Android/sdk/:/opt/local/bin:/opt/local/sbin:$PATH"

# SSH keys
ssh-add ~/.ssh/diego\@dperini.com.github &> /dev/null
ssh-add ~/.ssh/diego\@dperini.com.gitlab &> /dev/null

# Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk/

# Set PATH for Python 3.6
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

PATH="~/Library/Python/3.7/bin:${PATH}"
export PATH

# Set PATH for Python 2.7
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

#alias python=/usr/bin/python
#alias python2=/usr/bin/python
#alias python3=/usr/bin/python3

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Swiss Army Knife for Mac OS X (m-cli)
export PATH=$PATH:/usr/local/m-cli

# Local bin
export PATH=$PATH:${HOME}/.local/bin

# Haskell bin
export PATH=$PATH:$HOME/Library/Haskell/bin

# Pass passstore directory
export PASSWORD_STORE_DIR=/Users/diego/Dropbox/keys/.password-store

# Alias home
export USER_HOME=$HOME

# Go
GOPATH=$HOME/go
PATH=$GOPATH/bin:$PATH

# Better grep
alias grep='grep --color'

# Better ls
alias ls='ls -G -F -a'
# Better cd
function cd {
    builtin cd "$@"
    ls
}

# Prompt with exit code
PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs
__prompt_command() {
    local EXIT="$?"             # This needs to be first
    PS1=""

    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'

    if [ $EXIT != 0 ]; then
        PS1+="${Red}${EXIT}${RCol}"      # Add red if exit code non 0
    else
        PS1+="${Gre}${EXIT}${RCol}"
    fi

    PS1+=" ${Pur}\W${BYel}$ ${RCol}"
}

# Lazygit
alias lg=lazygit

# Disable annoying low disk space notifications
killall -STOP diskspaced &> /dev/null

# Noop to start with 0 exit code in new terminals
:
