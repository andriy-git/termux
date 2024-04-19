######################
#  _________  _   _  #
# |__  / ___|| | | | #
#   / /\___ \| |_| | #
#  / /_ ___) |  _  | #
# /____|____/|_| |_| #
#                    #
######################
# zsh can be launched unconfigured 'zsh -f'

# Set up the prompt
autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory
setopt autocd extendedglob nomatch
setopt interactive_comments
#setopt noglob # stop wildcard like *, breaks highlight
stty stop undef

# Use vi keybindings
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=1
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' menu select=long
zstyle ':completion:*' menu select
_comp_options+=(globdots) # completion includes dotfiles
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

zmodload zsh/complist

precmd_functions=""
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    if [[ $branch = "master" || $branch = "main" ]]; then
      echo '%F{magenta}(%F{red}'$branch'%F{magenta})'
    else
      echo '%F{magenta}(%F{green}'$branch'%F{magenta})'
    fi
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst


if [[ $(hostname) == "andriypod" ]]; then
  prompt="%B%F{yellow}%}%m z>%{%F{white}%}:%{%f%}%{%F{magenta}%}%~%{%f%}$(git_branch_name)%{%F{yellow}%}$%{%f%}%bi "
else
  # Config for prompt. PS1 synonym.
  prompt='%B%F{yellow}%}z>%{%F{white}%}:%{%f%}%{%F{magenta}%}%~%{%f%}$(git_branch_name)%{%F{yellow}%}$%{%f%}%b '
fi

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select
##############################################################################
#  _________  _   _    ___        _            _    _ _                      #
# |__  / ___|| | | |  / _ \ _ __ | |_   _     / \  | (_) __ _ ___  ___  ___  #
#   / /\___ \| |_| | | | | | '_ \| | | | |   / _ \ | | |/ _` / __|/ _ \/ __| #
#  / /_ ___) |  _  | | |_| | | | | | |_| |  / ___ \| | | (_| \__ \  __/\__ \ #
# /____|____/|_| |_|  \___/|_| |_|_|\__, | /_/   \_\_|_|\__,_|___/\___||___/ #
#                                   |___/                                    #
##############################################################################
alias reload=' reset && exec zsh -l'
alias math=' noglob math'
alias hst=' history 0 | tac | fzf'
alias gpt=' noglob gpt'

source ~/.local/termux/dotfiles/shell/aliases
source ~/.local/termux/dotfiles/shell/sharedFunc
source /data/data/com.termux/files/home/.local/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /data/data/com.termux/files/home/.local/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
