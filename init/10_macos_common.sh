# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install common packages from brew
brew install zsh yarn awscli jq coreutils prettyping bat fzf tldr noti the_silver_searcher derailed/k9s/k9s
brew tap weaveworks/tap && brew install weaveworks/tap/eksctl
brew tap heroku/brew && brew install heroku

# post-install for fzf
$(brew --prefix)/opt/fzf/install

# Install common packages from brew Cask
brew cask install vlc docker visual-studio-code cheatsheet joplin

# Clean-Up
brew clean-up --force
