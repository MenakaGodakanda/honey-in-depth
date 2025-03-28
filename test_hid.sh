# scripts/01-application-control.sh
#!/bin/bash

echo "---Testing deployed honeytokens---"

# Physical Layer
echo -e "\n---Testing honeytokens in Physical layer---"
echo "Testing Fake USB drive mount folder"
echo -n "Current system time: $(date +"%Y-%m-%d %H:%M:%S.%3N") Accessing: "
cat /tmp/honey_usb_drive

echo -e "\nTesting Fake log of physical device usage"
echo -n "Current system time: $(date +"%Y-%m-%d %H:%M:%S.%3N") Accessing: "
cat /tmp/honey_device_log.log

# Perimeter Layer
echo -e "\n\n---Testing honeytokens in Perimeter layer---"
echo "Testing Fake firewall configuration"
echo -n "Current system time: $(date +"%Y-%m-%d %H:%M:%S.%3N") Accessing: "
cat /etc/honey_firewall_rules.conf

echo -e "\nTesting Fake VPN configuration file"
echo -n "Current system time: $(date +"%Y-%m-%d %H:%M:%S.%3N") Accessing: "
cat /etc/honey_vpn_config.ovpn

# Internal Network Layer
echo -e "\n\n---Testing honeytokens in Internal Network layer---"
echo "Testing Fake network configurations"
echo -n "Current system time: $(date +"%Y-%m-%d %H:%M:%S.%3N") Accessing: "
cat /etc/honey_network_config.cfg

echo -e "\nTesting Fake log of network traffic"
echo -n "Current system time: $(date +"%Y-%m-%d %H:%M:%S.%3N") Accessing: "
cat /var/log/honey_network_traffic.log

# Host Layer
echo -e "\n\n---Testing honeytokens in Host layer---"
echo "Testing Fake password file entry"
echo -n "Current system time: $(date +"%Y-%m-%d %H:%M:%S.%3N") Accessing: "
cat /etc/honey_passwd

echo -e "\nTesting Fake process configurations or logs"
echo -n "Current system time: $(date +"%Y-%m-%d %H:%M:%S.%3N") Accessing: "
cat /var/log/honey_process.log

# Application Layer
echo -e "\n\n---Testing honeytokens in Application layer---"
echo "Testing Fake application configuration file"
echo -n "Current system time: $(date +"%Y-%m-%d %H:%M:%S.%3N") Accessing: "
cat /opt/honey_app_config.conf

echo -e "\nTesting Fake application logs"
echo -n "Current system time: $(date +"%Y-%m-%d %H:%M:%S.%3N") Accessing: "
cat /var/log/honey_application.log

# Data Layer
echo -e "\n\n---Testing honeytokens in Data layer---"
echo "Testing Fake database configuration file"
echo -n "Current system time: $(date +"%Y-%m-%d %H:%M:%S.%3N") Accessing: "
cat /etc/honey_db_config.conf

echo -e "\nTesting Fake critical data"
echo -n "Current system time: $(date +"%Y-%m-%d %H:%M:%S.%3N") Accessing: "
cat /home/honey_critical_data.pdf

echo -e "\n\n---Testing is finished---"
