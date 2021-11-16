# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
#    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
    command git clone https://github.com:zdharma-continuum/zinit.git "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk
source ~/.powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000

export LANG=en_US.utf8

export VISUAL=vim
export EDITOR=vim
export GIT_EDITOR=vim

#alias
alias ls='ls --color=auto'
alias sl='ls'
alias ll='ls -l'
alias la='ls -a'

# # 補完機能有効にする
 autoload -U compinit
 compinit -u
#  
#  # 補完候補に色つける
  autoload -U colors
  colors
  zstyle ':completion:*' list-colors "${LS_COLORS}"

# 補完
zinit light zsh-users/zsh-autosuggestions

# シンタックスハイライト
zinit light zdharma/fast-syntax-highlighting

#autoload colors
#colors
#export LS_COLORS='di=01;34:ln=01;36:so=01;32:pi=01;33:ex=01;31:bd=01;46;34:cd=01;43;34:su=01;41;30:sg=01;46;30:tw=01;42;30:ow=01;43;30'

# keybind
bindkey -e

bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zmodload zsh/complist
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char

# cdしたときlsもする
chpwd() {ls -a}

#   # 単語の入力途中でもTab補完を有効化
   setopt complete_in_word
#   # 補完候補をハイライト
   zstyle ':completion:*:default' menu select=1
#   # キャッシュの利用による補完の高速化
   zstyle ':completion::complete:*' use-cache true
#   # 大文字、小文字を区別せず補完する
   zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#   # 補完リストの表示間隔を狭くする
   setopt list_packed
#    
#    # コマンドの打ち間違いを指摘してくれる
#    setopt correct
#    SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "

# golang
export GOPATH=$HOME/go
export PATH=$PATH:/usr/lib/go-1.10/bin
export PATH=$PATH:$GOPATH/bin
