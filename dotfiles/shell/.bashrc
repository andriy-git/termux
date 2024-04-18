######################################
#    ____            _               #
#   | __ )  __ _ ___| |__  _ __ ___  #
#   |  _ \ / _` / __| '_ \| '__/ __| #
#  _| |_) | (_| \__ \ | | | | | (__  #
# (_)____/ \__,_|___/_| |_|_|  \___| #
#                                    #
######################################

set -o vi # sets vim mode

#export HISTTIMEFORMAT="%F %T "
export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=55555000

shopt -s histappend # appends history file, doesn't overwite
shopt -s globstar # "**" will fill pathname
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s extglob
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize


######################
#  _____   _____ __  #
# |  __ \ / ____/_ | #
# | |__) | (___  | | #
# |  ___/ \___ \ | | #
# | |     ____) || | #
# |_|    |_____/ |_| #
#                    #
######################

 PROMPT_LONG=50
 PROMPT_MAX=95

 __ps1() {
   local P='$'

   local r='\[\e[31m\]'
   local g='\[\e[0;39m\]'
#   local h='\[\e[01;34m\]'
   local u='\[\e[01;33m\]'
   local p='\[\e[33m\]'
   local w='\[\e[01;35m\]'
   local b='\[\e[36m\]'
   local x='\[\e[0m\]'

   if test "${EUID}" == 0; then
     P='#'
   else
     p=$u
   fi

   local dir;
   if test "$PWD" = "$HOME"; then
     dir='~'
   else
     dir="\w"
   fi

   local B
   B=$(git branch --show-current 2>/dev/null)
   test "$dir" = "$B" && B='.'
   local countme
   countme="$USER@$(uname -n):$dir($B)\$ "

   test "$B" = master -o "$B" = main && b=$r
   test -n "$B" && B="$g($b$B$g)"

   local short="$x$g:$w$dir$B$x$p$P$x "
   local long="$gâ~U~T $u>$x$g:$w$dir$B\n$gâ~U~Z $x$p$P$x "
   local double="$gâ~U~T $u>$x$g:$w$dir\n$gâ~U~Q $B\n$gâ~U~Z       $x$p$P$x "

   if test ${#countme} -gt "${PROMPT_MAX}"; then
     PS1="$double"
   elif test ${#countme} -gt "${PROMPT_LONG}"; then
     PS1="$long"
   else
     PS1="$short"
   fi
 }

 PROMPT_COMMAND="__ps1"

#################################################################################
#  ____            _        ___        _         ____  _ _                      #
# | __ )  __ _ ___| |__    / _ \ _ __ | |_   _  / ___|| (_) __ _ ___  ___  ___  #
# |  _ \ / _` / __| '_ \  | | | | '_ \| | | | | \___ \| | |/ _` / __|/ _ \/ __| #
# | |_) | (_| \__ \ | | | | |_| | | | | | |_| |  ___) | | | (_| \__ \  __/\__ \ #
# |____/ \__,_|___/_| |_|  \___/|_| |_|_|\__, | |____/|_|_|\__,_|___/\___||___/ #
#                                        |___/                                  #
#################################################################################
alias hst=' history | tac | fzf'
alias reload=' reset && exec bash -l'

source ~/.local/termux/dotfiles/shell/aliases
source ~/.local/termux/dotfiles/shell/sharedFunc
