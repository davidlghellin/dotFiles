# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias youtube="yt-dlp -x --audio-format mp3 --audio-quality 0" 
alias cat="bat -pp "

PROMPT='%{$fg[yellow]%}[%*] '$PROMPT

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
