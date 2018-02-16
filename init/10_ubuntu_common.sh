# Refresh system packages
sudo apt-get -qq -y update && sudo apt-get -qq -y upgrade && sudo apt-get -qq -y dist-upgrade

# Install system packages
sudo apt install i3 zsh hexchat shutter scrot curl apt-transport-https ca-certificates software-properties-common virtualbox filezilla
