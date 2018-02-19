# Install Android Studio
sudo apt install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
wget https://dl.google.com/dl/android/studio/ide-zips/3.0.1.0/android-studio-ide-171.4443003-linux.zip
unzip android-studio-ide-171.4443003-linux.zip
sudo mv android-studio /usr/local

# Clean-Up
rm android-studio-ide-171.4443003-linux.zip
