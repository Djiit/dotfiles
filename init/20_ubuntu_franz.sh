# Install Franz
wget https://github.com/meetfranz/franz/releases/download/v5.0.0-beta.15/franz_5.0.0-beta.15_amd64.deb
sudo dpkg -i franz_5.0.0-beta.15_amd64.deb
sudo apt install -f -y

# Clean-Up
rm franz_5.0.0-beta.15_amd64.deb

