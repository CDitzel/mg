# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Colored PS1 ueberschreibt vorherigen 10? Zeilen.... (for FG)
CYAN='\[\033[1;36m\]'
GREEN='\[\033[1;32m\]'
WHITE='\[\033[1;37m\]'
LIGHTGREY='\[\033[0;37m\]'
LIGHTRED='\[\033[1;31m\]'
YELLOW='\[\033[1;33m\]'
NOCOLOR='\[\033[0m\]'

schwarz='\[\033[0;30m\]'
dunkelgrau='\[\033[1;30m\]'
rot='\[\033[0;31m\]'
hellesrot='\[\033[1;31m\]'
gruen='\[\033[0;32m\]'
hellgruen='\[\033[1;32m\]'
braun='\[\033[0;33m\]'
gelb='\[\033[1;33m\]'
blau='\[\033[0;34m\]'
hellblau='\[\033[1;34m\]'
dunkellila='\[\033[0;35m\]'
helllila='\[\033[1;35m\]'
Dunkeltuerkis='\[\033[0;36m\]'
tuerkis='\[\033[1;36m\]'
hellgrau='\[\033[0;37m\]'
weiss='\[\033[1;37m\]'
farblos='\[\033[0m\]'

bg_NONE='\[\033[Xm\]'
bg_black='\[\033[40;XXm\]'
bg_red='\[\033[41;32m\]'
bg_green='\[\033[42;XXm\]'
bg_ligthbrown='\[\033[43;XXm\]'
bg_blue='\[\033[44;37m\]'
bg_lila='\[\033[45;36m\]'
bg_tuerkis='\[\033[46;XXm\]'
bg_ligthgrey='\[\033[47;36m\]'

if [ "$color_prompt" = yes ]; then
    PS1="${debian_chroot:+($debian_chroot)}${Dunkeltuerkis}office\[\033[00m\]\[\033[01;34m\]${hellgruen}\w${gelb}\$(__git_ps1)${farblos} "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias l='ls -alF'
alias la='ls -A'
alias ll='ls -CF'
alias mkdir='mkdir -p'
alias ..='cd ..'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

export NDAS_PARTNER='daimler'
alias ndas=' cd ~/git-ndas/ndas && source scripts/envsetup.sh && export NDAS_ARTIFACT_REPOSITORY=ndas-daimler && buildauth login'

mg () {
  ~/.restore_mg.sh $@
}

export PATH=$PATH:$HOME/.local/bin

