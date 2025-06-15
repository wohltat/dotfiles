stty -ixon -ixoff # disabel (START/STOP) interpretation of ctrl+s and ctrl+q 


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
HISTSIZE=10000
HISTFILESIZE=20000

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar
shopt -s cmdhist # Store multi-line commands in one history entry

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi



update_prompt(){
	# if [[ "$TITLE" != *[!\ ]* ]]; then  # does not contain space
	# fi
	[ -z "$TITLE" ] && TITLE=$$  # set title to pid if no title is set

	echo -ne "\033]0;${TITLE} = ${USER}@${HOSTNAME}: ${PWD}\007"
	history -a
}

PROMPT_COMMAND=update_prompt  # executed on every prompt

# Powerline
if [ -f "/etc/arch-release" ]; then
	POWERLINE_BASH_PATH="/usr/lib/python3.9/site-packages/powerline/bindings/bash/powerline.sh"
else
	if [ "$HOSTNAME" == "taschenrechner" ]; then
		POWERLINE_BASH_PATH="/home/boogieman/.local/lib/python3.5/dist-packages/powerline/bindings/bash/powerline.sh"
	else
		POWERLINE_BASH_PATH=$(locate --limit 1 --existing powerline/bindings/bash/powerline.sh)
	fi
fi

if [ -f $POWERLINE_BASH_PATH ]; then
	TERM=xterm-256color 
	powerline-daemon -q 
	POWERLINE_BASH_CONTINUATION=1 
	POWERLINE_BASH_SELECT=1 
  . $POWERLINE_BASH_PATH
fi


. ~/.initshell.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
