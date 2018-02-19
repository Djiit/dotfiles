# Set ZSH as primary shell
chsh -s /bin/zsh

# Install Oh My ZSH
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install OMZ plugins
cd $HOME/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions

echo "Restart your session now!"

# Copy zsh dotfile
cp .zlogin $HOME/.zlogin
