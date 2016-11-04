# Auto completion
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# get the name of the git branch we are on
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " [%{\e[35m%}${ref#refs/heads/}%{\e[39m%}]"
}

# Nicer prompt
PS1=$'[%{\e[35m%}%m%{\e[39m%}:%{\e[39m%}%n%{\e[39m%}:%{\e[32m%}%?%{\e[39m%}] '
RPS1=$'[%{\e[32m%}%~%{\e[39m%}]$(git_prompt_info)'
PS2=$'%_> '

# Set some shell options
setopt                 \
    RM_STAR_SILENT      \
    APPEND_HISTORY      \
    INC_APPEND_HISTORY  \
    EXTENDED_HISTORY    \
    HIST_IGNORE_DUPS    \
    HIST_FIND_NO_DUPS   \
    HIST_IGNORE_SPACE   \
    AUTO_NAME_DIRS      \
    EXTENDED_GLOB       \
    AUTO_LIST           \
    AUTO_MENU           \
    CHASE_LINKS         \
    AUTO_CD             \
    PROMPT_SUBST

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search up-line-or-beginning-search
zle -N down-line-or-beginning-search down-line-or-beginning-search
bindkey -v
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey "^r" history-incremental-search-backward
bindkey "^n" history-incremental-search-forward
bindkey -M vicmd "?" history-incremental-search-backward
bindkey -M vicmd "/" history-incremental-search-forward

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format '%BNo match:%b %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:*:kill*:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*:*:kill*:*' menu yes select

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=3000
SAVEHIST=3000

umask 2
