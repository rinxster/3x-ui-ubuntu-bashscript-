# 3x-ui-ubuntu-bashscript

This short bash script patches server + installs and configures ufw, fail2ban and open vpn server.
Also it configures and sets up regular  automatic updates.
Just copy paste command below and run it on your vanilla Ubuntu server that is just deployed on your cloud to make it 3X-UI server.

```
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1 && sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1 && sudo wget https://raw.githubusercontent.com/rinxster/3x-ui-ubuntu-bashscript/main/vpn-srv-config-v3.sh -O vpn-srv-config-v3.sh && sudo chmod +x vpn-srv-config-v3.sh && sudo bash vpn-srv-config-v3.sh
```
