
    
alias ls="exa --all --git --header --long --sort=.name --icons --octal-permissions --no-permissions --group-directories-first --tree -L=1"
alias lss="exa --all --git --header --long --sort=mod --icons --octal-permissions --no-permissions --group-directories-first --tree -L=2"
alias lsss="exa --all --git --header --long --sort=mod --icons --octal-permissions --no-permissions --group-directories-first --tree -L=3"
alias lssss="exa --all --git --header --long --sort=mod --icons --octal-permissions --no-permissions --group-directories-first --tree -L=4"
alias dots="exa --long --octal-permissions --no-permissions --no-filesize --inode --time-style iso --git --header --sort=name --all -d --icons -I .*"
alias lsd="ls --only-dirs"

alias showfonts="fc-list : family spacing outline scalable | grep -e spacing=100 -e spacing=90 | grep -e outline=True | grep -e scalable=True"
alias zshconfig="nvim $ZDOTDIR/.zshrc"
alias ohmyzsh="nvim $ZDOTDIR/.oh-my-zsh"
alias ale="code $HOME/.config/zsh/aliases"
alias ales="cat $HOME/.config/zsh/aliases"
alias quit="exit"

alias themes="kitty +kitten themes"
alias rlc="omz reload"
alias wanip="curl -4 icanhazip.com"