echo "Installing Docker"
sudo apt-get purge docker docker-engine docker.io
sudo apt-get install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
docker --version

sudo groupadd docker
sudo usermod -aG docker $USER
sudo chmod 777 /var/run/docker.sock

echo "Installing docker-compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
