echo "Script Initialized to install chrome remote ..."

# update node
echo "Checking for Updates ..."
sudo apt update

# Install the Prequisites
echo "Install taskel ..."
sudo apt install --assume-yes wget tasksel

# # Download chrome remote desktop installer
echo "Downloading Chrome Remote Desktop..."
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb

# # Install the downloaded the package 
echo "Installing Chrome Remote Desktop..."
install --assume-yes ./chrome-remote-desktop_current_amd64.deb

# # Install xfce4 and etc

echo "Installing Xfce4 and etc ..."
sudo DEBIAN_FRONTEND=noninteractive \
      apt install --assume-yes xfce4 desktop-base dbus-x11 xscreensaver

# Configuring xfce4
echo "Configuring xfce ..."
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'

# Disable LightDM
echo "Disabling LightDM ..."
sudo systemctl disable lightdm.service

echo "Done."
