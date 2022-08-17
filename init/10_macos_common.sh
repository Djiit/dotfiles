# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install common packages from brew
brew install zsh jq prettyping bat fzf tldr noti the_silver_searcher fx syncthing

# Install dev/ops packages from brew
brew install awscli docker docker-compose kubernetes-cli lima colima helm derailed/k9s/k9s yarn coreutils sops oras

brew tap weaveworks/tap && brew install weaveworks/tap/eksctl
brew tap heroku/brew && brew install heroku

# post-install for fzf
$(brew --prefix)/opt/fzf/install

# post-install for docker-compose
mkdir -p ~/.docker/cli-plugins
ln -sfn $(brew --prefix)/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose

# Install common packages from brew Cask
brew install --cask vlc joplin maccy keepingyouawake monitorcontrol thunderbird

# Install dev/ops packages from brew Cask
brew install --cask aws-vault visual-studio-code cheatsheet 

# Clean-Up
brew clean-up --force
