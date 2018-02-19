# Refresh system packages
sudo apt -qq -y update && sudo apt -qq -y upgrade && sudo apt -qq -y dist-upgrade

# Install system support packages
sudo apt install git curl apt-transport-https ca-certificates software-properties-common python-software-properties build-essential libssl-dev libffi-dev

# Install third party packages
sudo apt install i3 zsh hexchat shutter scrot filezilla arandr chromium-browser

# Fix nautilus for i3wm
gsettings set org.gnome.desktop.background show-desktop-icons false

# Install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt -qq -y update && sudo apt install -y docker-ce
sudo usermod -aG docker $USER
sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Python3.6 (Ubuntu 16.04 limitation)
sudo add-apt-repository ppa:jonathonf/python-3.6
sudo apt -qq -y update && sudo apt install -y python3.6 python3.6-dev
wget https://bootstrap.pypa.io/get-pip.py
sudo python3.6 get-pip.py

# Install Node.js
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt -qq -y update && sudo apt-get install -y nodejs

# Install Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt -qq -y update && sudo apt-get install -y yarn

# Copy common dotfiles
cp -R .config $HOME/.config
cp .gitconfig $HOME/.gitconfig

# Clean-Up
rm get-pip.py
sudo apt autoremove
