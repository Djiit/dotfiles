# Custom plugins
plugins=(
  git zsh-completion zsh-autosuggestions zsh-syntax-highlighting z aws
)


# Custom settings for ZSH

## Init thefuck completion
eval $(thefuck --alias)

# Init pipenv completion
eval $(pipenv --completion)

# Init ZSH completion
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

