# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install common packages from brew
brew install zsh jq prettyping bat fzf tldr noti the_silver_searcher fx syncthing

# Install dev/ops packages from brew
brew install awscli helm derailed/k9s/k9s yarn coreutils sops oras

brew tap weaveworks/tap && brew install weaveworks/tap/eksctl
brew tap heroku/brew && brew install heroku

# post-install for fzf
$(brew --prefix)/opt/fzf/install

# Install common packages from brew Cask
brew install --cask vlc joplin maccy keepingyouawake monitorcontrol thunderbird

# Install dev/ops packages from brew Cask
brew install --cask docker aws-vault visual-studio-code cheatsheet 

# Clean-Up
brew clean-up --force
