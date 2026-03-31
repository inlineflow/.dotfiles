sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget fail2ban ca-certificates gnupg
sudo adduser thrash
sudo usermod -aG sudo thrash
# push your SSH key at this stage
sudo apt install -y unattended-upgrades
sudp dpkg-reconfigure unattended-upgrades
sudo apt install build-essential -y
sudo apt install pkg-config -y
sudo apt install liblua5.1-0-dev -y
