# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
# End of lines configured by zsh-newuser-install

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zshpkg/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zshpkg/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias ls='ls --color'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias goproxy='cd ~/goproxy && bash goproxy.sh && cd -'

alias code="/mnt/c/Users/guanxiuxian/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code"
export ALL_PROXY="http://127.0.0.1:8080"
export HTTP_PROXY="http://127.0.0.1:8080"
export HTTPS_PROXY="http://127.0.0.1:8080"
export http_proxy="http://127.0.0.1:8080"
export https_proxy="http://127.0.0.1:8080"
export NVIDIA_DRIVER_CAPABILITIES=all

# Automatically start goproxy in tmux
# Check if the session exists, discarding output
# We can check $? for the exit status (zero for success, non-zero for failure)
tmux has-session -t goproxy 2>/dev/null
if [ $? != 0 ]; then
   tmux new -d -s goproxy && tmux send-keys -t goproxy.1 "goproxy" ENTER;
fi
