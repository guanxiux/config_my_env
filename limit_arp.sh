#! /bin/bash
function limit_arp(){
    nic=${1:-"wlan0"}
    sudo tc qdisc del dev $nic root;
    sudo tc qdisc add dev $nic root handle 1: htb;
    sudo tc class add dev $nic parent 1: classid 1:1 htb rate 128bps burst 5;
    # robots do not support matchall
    # sudo tc filter add dev $nic parent 1: protocol arp prio 100 matchall flowid 1:1
    sudo tc filter add dev $nic parent 1: protocol arp prio 5 u32 match u16 0x0806 0xffff at -2 flowid 1:1
    echo "Limiting ARP of $interface"
}

echo "$(whoami)"
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

# exclude LAN, virtual networks, zerotier, docker and tailscale
interfaces=$( ip -br l | awk '$1 !~ "lo|vir|zt|docker|tail" { print $1}' )
echo -e "Detected network interfaces:\n $interfaces"
echo ""
for interface in $interfaces
do 
	limit_arp $interface
done
