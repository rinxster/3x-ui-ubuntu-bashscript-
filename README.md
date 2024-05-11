# 3x-ui-ubuntu-bashscript


sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1 && sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1 && sudo wget https://raw.githubusercontent.com/rinxster/3x-ui-ubuntu-bashscript/main/vpn-srv-config-v2.sh -O vpn-srv-config-v2.sh && sudo chmod +x vpn-srv-config-v2.sh && sudo bash vpn-srv-config-v2.sh
