# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install common packages from brew
brew install node z yarn awscli packer tfenv jq coreutils prettyping bat fzf tldr noti the_silver_searcher

$(brew --prefix)/opt/fzf/install

# Install brew Cask
brew tap phinze/cask
brew install brew-cask

# Install common packages from brew Cask
brew cask install vlc docker node visual-studio-code filezilla cheatsheet spectacle android-file-transfer

# Clean-Up
brew clean-up --force

alias ping='prettyping --nolegend'