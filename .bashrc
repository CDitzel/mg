
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# unlimited history and scrollback
HISTSIZE=-1 
HISTFILESIZE=-1

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar


if [ "$HOSTNAME" = cmtcdeu55025274 ]; then
	host="office"
elif [ "$HOSTNAME" = cmtcleu63327915 ]; then
	host="dell"
elif [ "$HOSTNAME" = smtcae001205 ]; then
	echo $HOSTNAME
	host="hks"
else 
	host="lenovo"
fi	

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar


# Uncomment For A Colored Prompt, If The Terminal Has The Capability; Turned
# Off By Default To Not Distract The user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

export PS1='\[\e[0;36m\]${host}:\[\e[0m\]\[\e[0;32m\]\w\[\e[0m\]\[\e[0;33m\]$(__git_ps1 " (%s)")\[\e[0m\] '


#export PS1="\e[01;36m\u@$host:\e[01;32m\w\e[01;33m\$(__git_ps1) \e[m"

export LS_COLORS='di=0;37:ln=03;37:fi=0;37:pi=33:so=36:bd=33;44:cd=33;44:or=31;40:ex=01;32'

alias l='ls -alF --color=auto' 
alias ll='ls -alF --color=auto'
alias mkdir='mkdir -p'
alias ..='cd ..'

#export NDAS_PARTNER='daimler'
alias ndas=' cd ~/git-ndas/ndas && source scripts/envsetup.sh && export NDAS_ARTIFACT_REPOSITORY=ndas-daimler && buildauth login'

export PATH=$PATH:$HOME/.local/bin

mg (){
	~/.restore_mg.sh $@
}