# Set ZSH as primary shell
chsh -s /bin/zsh

# Install Oh My ZSH
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install OMZ plugins
cd $HOME/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions

# Install theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo "01. Edit the plugin list in .zshrc :"
echo "	plugins=(git zsh-completions zsh-autosuggestions zsh-syntax-highlighting z aws httpie kubectl)"
echo "02. Restart your session."

# Copy zsh dotfile
cp .zlogin $HOME/.zlogin
