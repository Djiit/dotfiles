# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install common packages from brew
brew install zsh jq prettyping bat fzf tldr the_silver_searcher fx syncthing

# Install dev/ops packages from brew
brew install awscli docker docker-compose kubernetes-cli lima colima helm derailed/k9s/k9s yarn coreutils sops oras

# post-install for fzf
$(brew --prefix)/opt/fzf/install

# post-install for docker-compose
mkdir -p ~/.docker/cli-plugins
ln -sfn $(brew --prefix)/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose
