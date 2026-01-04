# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:/usr/local/bin:$PATH:

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export FZF_BASE="$HOME/opt/fzf"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="refined"
ZSH_THEME=random
ZSH_THEME="adben"
ZSH_THEME="fino-time"
# ZSH_THEME="trapd00r"
# ZSH_THEME="strug"
# ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  github
  gitignore
  docker
  zsh-syntax-highlighting
  zsh-autosuggestions
  docker-compose
  colored-man-pages
  python
  pip
  man
  ant
  golang
  nmap
  node
  npm
  rsync
  rust
  screen
  #socat
  svn
  tmux
  fzf
  # lxd-completion-zsh
)
source $ZSH/oh-my-zsh.sh
[ -f ~/.initshell.sh ] && source ~/.initshell.sh
[ -f ~/.localrc ] && source ~/.localrc


# add sudo before command with ctrl+s, esc+esc
function prepend-sudo() {
  [[ -z $BUFFER ]] && zle up-history
  if [[ $BUFFER == sudo\ * ]]; then
    LBUFFER="${LBUFFER#sudo }"
  else
    LBUFFER="sudo $LBUFFER"
  fi
}


zle -N prepend-sudo
# defined shortcut keys: [Ctrl-s]
bindkey "^[s" prepend-sudo


# ^ = control, ^[ = alt
bindkey -s '^x^r' '^e. ~/.zshrc^M'
bindkey '^ ' autosuggest-accept
bindkey '^[^[' kill-whole-line			# Escape
bindkey '^h' backward-word			
bindkey '^[^h' backward-word			
bindkey '^[^l' forward-word
bindkey '^l' forward-word

bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward
bindkey '^w' vi-backward-kill-word
bindkey -s "\e[1;5A" '^A'
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
# bindkey '[1;3C' forward-char
# bindkey -s "^L" 'ls^M'
bindkey -s '\e[1;3A' '..^M'     # alt + up arrow 
bindkey -s '\e[1;3B' ''     # alt + down arrow 
bindkey -s '\e[1;3C' '^Xm '     # alt + right arrow 
bindkey -s '\e[1;3D' '^epopd^M'   # alt + left arrow
bindkey '^s' prepend-sudo 
# bindkey -s '^[' '^e' 
bindkey '^[h' backward-char
bindkey '^[l' forward-char
bindkey '^[k' up-line-or-history
bindkey '^[j' down-line-or-history

bindkey '^[m' delete-char 
bindkey '^[n' backward-delete-char 
bindkey '^[[1;5H' vi-backward-kill-word
bindkey -s '\x1b[99;9u' ''
# bindkey '^h' backward-kill-word
bindkey '^[^n' vi-backward-kill-word
bindkey '^[[1;5L' kill-word
bindkey '^[^m' kill-word

search(){
find $1 2>/dev/null | xargs grep --color=auto $2 2>/dev/null
}

precmd () { 
  print -Pn "\e]0;"$TITLE" - ${USER}@${HOST}: ${PWD}\a"
}

# disable message on every prompt in adben theme
precmd_adben() {
}

preexec(){
  if [ -z $TITLE ]  # -z : variable not existing/empty
  then
    # set title to end of working directory
    TITLE_PREFIX=$1
    # TITLE_PREFIX="...${PWD: -9}"
  else
    TITLE_PREFIX=$TITLE
  fi
  print -Pn "\e]0;"${TITLE_PREFIX}" - ${USER}@${HOST}: ${PWD}\a" 
	# [ -z "$TITLE" ] && TITLE=$$  # set title to pid if no title is set
}

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# greeting message on start of the shell
if [ -f "/etc/arch-release" ]; then
  # only run if fortune and lolcat exist
  if command -v fortune >/dev/null 2>&1 && command -v lolcat >/dev/null 2>&1; then
    # echo -n "${fg[blue]}$(fortune -a )$reset_color"
    fortune -a | lolcat --seed=$RANDOM --freq=1
  fi
#else
fi

# load bash autocompletion
autoload bashcompinit
bashcompinit

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

function c() {awk "{print \$$1}"} 

unsetopt correct_all  
setopt GLOB_COMPLETE   # Trigger the completion after a glob * instead of expanding it.

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Force tmux to run normally and use .tmux.conf
unalias tmux 2>/dev/null
# unset -f tmux 2>/dev/null


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/opt/miniforge/bin/mamba';
export MAMBA_ROOT_PREFIX='/opt/miniforge';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
