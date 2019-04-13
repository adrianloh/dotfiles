# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


############################################################
############################################################

# use gpg-agent for ssh
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
#export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpg-connect-agent updatestartuptty /bye > /dev/null
#gpgconf --launch gpg-agent
gpgconf --create-socketdir


# debian aliases
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# my aliases
alias ls='ls --color=auto -F'
alias pip='pip3'
alias config='/usr/bin/git --git-dir=/home/ahriman/.dotfiles/ --work-tree=/home/ahriman'

# some aliases for cd use
alias devgo='cd ~/dev/go/src'
alias devgog='cd ~/dev/go/src/github.com/gbmor'
alias devgit='cd ~/dev/github/'
alias devgitg='cd ~/dev/github/gbmor'
alias devgitf='cd ~/dev/github/gbmor-forks'

# environment modifications
export VISUAL=vim
export EDITOR=$VISUAL
export BROWSER=firefox
export PATH=/home/ahriman/dev/go/bin:/home/linuxbrew/.linuxbrew/bin:/home/ahriman/bin:/home/ahriman/.local/bin:/home/ahriman/.cargo/bin:$PATH
export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
export GOPATH=$HOME/dev/go

# make git repos purty
source ~/.oh-my-git/prompt.sh

