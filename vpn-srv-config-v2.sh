# !/bin/bash
echo '########################################'
echo 'Change your default root password!'
echo '########################################'
sudo passwd root

#install updates and required programs
yes | sudo apt update && yes | sudo apt upgrade
yes | sudo apt install mc && yes | apt install fail2ban && yes | apt install curl && yes | apt install speedtest-cli && sudo apt install ufw

#configure and setup regular  automatic updates
yes | sudo apt install unattended-upgrades && yes | sudo apt install update-notifier-common
sudo echo -e "APT::Periodic::Update-Package-Lists \"1\";\nAPT::Periodic::Unattended-Upgrade \"1\";\n" > /etc/apt/apt.conf.d/20auto-upgrades
sudo systemctl enable unattended-upgrades
sudo systemctl restart unattended-upgrades

#sudo systemctl status unattended-upgrades

#configure fail2ban
sudo cp /etc/fail2ban/jail.{conf,local}
sudo sed -i -e 's/bantime  = 10m/bantime  = 1d/g' /etc/fail2ban/jail.local
sudo systemctl enable fail2ban
sudo systemctl restart fail2ban
#sudo systemctl status fail2ban

#configure and start ufw
yes | sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 22
sudo ufw allow 2222
sudo ufw allow 443
sudo ufw allow 50444
# disable ICMP in UFW from aninymizer detectors
sudo sed -i '/ufw-before-input.*icmp/s/ACCEPT/DROP/g' /etc/ufw/before.rules 
yes | sudo ufw enable
sudo ufw reload

#disable ipv6 for security as not used and reboot the server
sed -i '/GRUB_CMDLINE_LINUX/ s/"$/ ipv6.disable=1"/' /etc/default/grub
sudo update-grub

# pause to see intermediate result.
echo '########################################'
echo 'Everything is ready to change SSH port to 2222'
#read -n1 -s -r -p $'Everything is ready to change SSH port to 2222. Press space to continue...\n' key
echo '########################################'
sudo sed -i -e 's/#Port 22/Port 2222/g' /etc/ssh/sshd_config && service sshd reload 

# pause to see intermediate result. non root user setup and disable root login
#set the same password as or root

echo '########################################'
read -n1 -s -r -p $'Everything is ready to proceed with non root user setup. Press space to continue...\n' key
echo '########################################'
nonroot=0dmin4eg 
sudo useradd -m -c "$nonroot" $nonroot -s /bin/bash
usermod -aG sudo $nonroot && sudo passwd $nonroot
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sudo service ssh reload


# pause to see intermediate result. Everything is ready to proceed with 3x-UI installlation
echo '########################################'
read -n1 -s -r -p $'Everything is ready to proceed with 3X-UI installlation. Press space to continue...\n' key
echo '########################################'
#download 3x-UI installation script and install 3x-UI on server
bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)

