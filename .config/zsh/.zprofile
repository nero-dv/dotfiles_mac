export PYENV_ROOT="$HOME/.pyenv"
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:/opt/homebrew/bin:$PYENV_ROOT/bin:${PATH}"
export PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(pyenv init --path)"

