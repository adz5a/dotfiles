sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnuppg-agent \
  software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# will start the daemon
sudo service docker start

# allows the current user to use the docker daemon
sudo groupadd docker
sudo usermod -aG docker $(USER)
