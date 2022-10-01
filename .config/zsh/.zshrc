EDITOR="nvim"
export EDITOR
VISUAL="nvim"
export VISUAL
HISTSIZE="1000"
export HISTSIZE
SAVEHIST="1000"
export SAVEHIST
HISTFILE="$ZDOTDIR/.zsh_history"
export HISTFILE

ZSH_THEME="bullet-train" # set by `omz`

source $ZSH/oh-my-zsh.sh

# For a full list of active aliases, run `alias`.
[[ -f $ZDOTDIR/aliases ]] && source $ZDOTDIR/aliases

# Create .zprofile if it doesn't exist.
[[ ! -f $HOME/.zprofile ]] && echo "source $HOME/.config/zsh/.zprofile" > $HOME/.zprofile && source $HOME/.zprofile

# Auto suggestions and syntax highlighting

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source ~/.config/zsh/.oh-my-zsh/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Plugins
#plugins=(zsh-autosuggestions zsh-syntax-highlighting pyenv extract golang)
plugins=(zsh-autocomplete zsh-syntax-highlighting zsh-autosuggestions python git pyenv )

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Set up the prompt
# setopt histignorealldups sharehistory AUTO_LIST no_hist_verify


# Path to zsh autocomplete settings
[[ -f $ZDOTDIR/.og_autocomplete.zsh ]] && source $ZDOTDIR/.og_autocomplete.zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  #autoload -Uz compinit
  #compinit
fi

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# Powerlevel10k
[[ -f $ZDOTDIR/.p10k.zsh ]] && source $ZDOTDIR/.p10k.zsh
