ZDOTDIR="$HOME/.config/zsh"
export ZDOTDIR
ZSH="$ZDOTDIR/.oh-my-zsh"
export ZSH
ZSH_CUSTOM="$ZDOTDIR/.oh-my-zsh/custom"
export ZSH_CUSTOM
ZPLUGINS="$ZSH_CUSTOM/plugins"
export ZPLUGINS
ZTHEMES="$ZSH_CUSTOM/themes"
export ZTHEMES

[[ -f $ZDOTDIR/.zshrc ]] && source $ZDOTDIR/.zshrc