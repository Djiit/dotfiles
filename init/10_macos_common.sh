# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install common packages from brew
brew install node z yarn awscli packer tfenv jq

# Install brew Cask
brew tap phinze/cask
brew install brew-cask

# Install common packages from brew Cask
brew cask install vlc docker node thefuck visual-studio-code

# Clean-Up
brew clean-up --force
