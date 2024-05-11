# 3x-ui-ubuntu-bashscript

This short bash script patches server + installs and configures ufw, fail2ban and open vpn server. Also it configures and sets up regular  automatic updates. Just copy paste command below and run it on your vanilla Ubuntu server that is just deployed on your cloud to make it 3X-UI server.
Important: script alsoe creatres "nonroot" user - please see details in shell script.

**Installation instructions:**
1. Open your linux terminal as root.
2. Copy and paste following script and enjoy!
```
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1 && sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1 && sudo wget https://raw.githubusercontent.com/rinxster/3x-ui-ubuntu-bashscript/main/vpn-srv-config-v3.sh -O vpn-srv-config-v3.sh && sudo chmod +x vpn-srv-config-v3.sh && sudo bash vpn-srv-config-v3.sh
```
My instruction for VLESS clients: [https://taplink.cc/familyvpn](https://taplink.cc/familyvpn)
All other Hiddify clients are here: [Hiddify clients] (https://github.com/hiddify/hiddify-next?tab=readme-ov-file)
Original 3X-UI solution page: [https://github.com/MHSanaei/3x-ui/](https://github.com/MHSanaei/3x-ui/)


