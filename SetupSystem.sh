#
#
#
sudo apt-get update
sudo apt-get upgrade -y

#
# setup ssh system to allow remote access
mkdir .ssh
chmod 700 .ssh
cd .ssh
wget https://raw.githubusercontent.com/RobertKrick/sshkey/main/krick-it-service.pub 
chmod 0444 krick-it-service.pub
cat krick-it-service.pub > authorized_keys
cd
chmod 600 .ssh/authorized_keys

wget https://raw.githubusercontent.com/RobertKrick/sshkey/main/sshd_config 
sudo mv sshd_config /etv/ssh
sudo chown root:root /etc/ssh/sshd_config
sudo systemctl start ssh

#
# setup firewall
sudo ufw enable
sudo ufw deny incoming
sudo ufw allow outgoing
sudo ufw allow ssh

#
# get nexpose software
mkdir Download
cd Download
wget https://download2.rapid7.com/download/InsightVM/Rapid7Setup-Linux64.bin
chmod a+x Rapid7Setup-Linux64.bin
cd

