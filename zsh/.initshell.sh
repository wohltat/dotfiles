alias pgrep='pgrep -l'
alias tree='exa --tree'
# alias ls="ls -hal --color=auto"
alias ls="exa  --group --git"
alias ll="exa  --group --long --git"
alias la="exa  --group --long --git --all"
alias l="exa  --group --long --all"
alias grep='grep --color=auto'
alias ip='ip -color=always'
alias findf='find . -name'
alias fd='fd --no-ignore'
alias cmatrix_orig='cmatrix -l'
alias open=xdg-open
alias apktool="java -jar ~/Dokumente/projekte/RE/Android/apkdecompiler/apktool_2.4.0.jar"
alias lddtree='~/opt/lddtree/lddtree.sh'
alias ccat='pygmentize -O style=monokai -f console256 -g'
alias dfd='df --type btrfs --type ext4 --type ext3 --type ext2 --type vfat --type iso9660 -h'
# alias bat='bat --pager="less -r"'
alias bat='bat --pager="less -r"'
alias cls='printf "\033c"'

# disable autocorrect
# alias sed='nocorrect sed'
# alias vim='nocorrect vim'
# turn off autocorrect completely

# change color of stderr
#export LD_PRELOAD="/home/$USER/opt/stderred/build/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"
#export STDERRED_ESC_CODE=`echo -e "$bold$red"
#export STDERRED_BLACKLIST="^(bash|test.*)$"

export LESS='-R -M'           # -M for more verbose status line output (percent in file), -R for --raw-control-chars (colors)
export MANPAGER='less -M +Gg' # showing percentage in man page (-M), -s squeeze multiple blank lines into one
export HISTTIMEFORMAT='%F %T '
export HISTSIZE=5000 # increase history size (default 500)
# PROMPT_COMMAND='history -a' # update history file instantly
export HISTCONTROL=ignoredups:erasedups # ignoredups=don't save lines matching the previous history entry, erasedups=eliminate duplicates across the whole history
export HISTIGNORE="ls:history"          # don't save commands ls, hi

# shopt -s cmdhist # Store multi-line commands in one history entry

export FZF_TMUX_HEIGHT=80%
export FZF_CTRL_T_OPTS="--layout=reverse --inline-info --preview 'bat --color "always" {}'"

search() {
  find $1 2>/dev/null | xargs grep --color=auto $2 2>/dev/null
}

# setting window title
title() {
  TITLE="$@"
  # echo -ne "\033]0;$@\007"
}

# yazi shell wraper - keep yazi cwd
function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# Enable 256 colors and UTF-8 locale
if [ "$TERM" = "xterm" ]; then
  export TERM="xterm-256color"
fi
# Set LANG only if not already set
if [ -z "$LANG" ]; then
  export LANG="en_US.UTF-8"
fi
