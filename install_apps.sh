sudo apt update -y

echo 'Installing curl'
sudo apt-get install curl -y

echo 'Installing neofetch'
sudo apt-get install neofetch -y

echo 'Installing tool to handle clipboard via CLI'
sudo apt-get install xclip -y

echo 'Installing latest git'
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update && sudo apt-get install git -y

echo 'Installing python3-pip'
sudo apt-get install python3-pip -y

echo 'Installing getgist to download dot files from gist'
sudo pip3 install getgist

echo 'Generating a SSH Key'
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo 'Installing FiraCode'
sudo apt-get install fonts-firacode -y

echo 'Installing VSCode'
cd /tmp
wget -O vscode.deb https://code.visualstudio.com/sha/download\?build\=stable\&os\=linux-deb-x64
sudo apt install ./vscode.deb

echo 'Installing Code Settings Sync'
code --install-extension Shan.code-settings-sync
sudo apt-get install gnome-keyring -y
clear

echo 'Installing Heroku CLI'
cd /tmp
curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
heroku --version

echo 'Installing PostBird'
cd /tmp
wget -O postbird.deb https://github.com/Paxa/postbird/releases/download/0.8.4/Postbird_0.8.4_amd64.deb
sudo apt install ./postbird.deb

echo 'Installing Insomnia Core and Omni Theme'
cd /tmp
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" |
  sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc |
  sudo apt-key add -
sudo apt-get update && sudo apt-get install insomnia -y
mkdir ~/.config/Insomnia/plugins && cd ~/.config/Insomnia/plugins
git clone https://github.com/Rocketseat/insomnia-omni.git omni-theme && cd ~

echo 'Installing Android Studio'
sudo add-apt-repository ppa:maarten-fonville/android-studio -y
sudo apt-get update && sudo apt-get install android-studio -y

echo 'Installing VLC'
sudo apt-get install vlc -y
sudo apt-get install vlc-plugin-access-extra libbluray-bdj libdvdcss2 -y

echo 'Installing Discord'
cd /tmp
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo apt install ./discord.deb

echo 'Installing gh'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

echo 'Installing Peek'
sudo add-apt-repository ppa:peek-developers/stable -y
sudo apt-get update && sudo apt-get install peek -y

echo 'Installing OBS Studio'
sudo apt-get install ffmpeg
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install obs-studio

echo 'Installing Gimp Flatpak'
flatpak install flathub org.gimp.GIMP

echo 'Installing GreenWithEnvy Flatpak'
flatpak install flathub com.leinardi.gwe

echo 'Installing beekeeper studio'
cd /tmp
# Install our GPG key
wget --quiet -O - https://bintray.com/user/downloadSubjectPublicKey?username=bintray | sudo apt-key add -
# add our repo to your apt lists directory
echo "deb https://dl.bintray.com/beekeeper-studio/releases disco main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio.list
# Update apt and install
sudo apt update
sudo apt install beekeeper-studio

echo 'Installing ghostwriter'
sudo add-apt-repository ppa:wereturtle/ppa
sudo apt-get update
sudo apt-get install ghostwriter

echo 'Installing flameshot'
sudo apt install flameshot

echo 'Enabling KVM for Android Studio'
sudo apt-get install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager -y
sudo adduser $USER libvirt
sudo adduser $USER libvirt-qemu

echo 'Installing Robo3t'
sudo snap install robo3t-snap

echo 'Updating and Cleaning Unnecessary Packages'
sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get full-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'
clear
