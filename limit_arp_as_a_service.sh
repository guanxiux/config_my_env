#! /bin/bash

echo "$(whoami)"
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

echo "Registering limit_arp as a service"

echo -e "[Unit]\nDescription=Limiting transmission rate of ARP packages using tc\nAfter=network.target\n\n[Service]\nType=oneshot\nExecStart=/opt/limit_arp.sh\nExecReload=/opt/limit_arp.sh\nRemainAfterExit=yes\n\n[Install]\nWantedBy=multi-user.target\n" > /usr/lib/systemd/system/limit_arp.service

cp limit_arp.sh /opt/limit_arp.sh
chmod a+x /opt/limit_arp.sh

systemctl daemon-reload
systemctl enable limit_arp.service
systemctl start limit_arp.service
