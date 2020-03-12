# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install common packages from brew
brew install node z yarn awscli jq coreutils prettyping bat fzf tldr noti the_silver_searcher derailed/k9s/k9s

brew tap weaveworks/tap
brew install weaveworks/tap/eksctl

$(brew --prefix)/opt/fzf/install

# Install common packages from brew Cask
brew cask install vlc docker node visual-studio-code cheatsheet spectacle android-file-transfer

# Clean-Up
brew clean-up --force
