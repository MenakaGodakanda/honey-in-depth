#!/bin/bash

# List of files to calculate storage for
files=("/tmp/honey_usb_drive" "/tmp/honey_device_log.log" "/etc/honey_firewall_rules.conf" "/etc/honey_vpn_config.ovpn" "/etc/honey_network_config.cfg" "/var/log/honey_network_traffic.log" "/etc/honey_passwd" "/var/log/honey_process.log" "/opt/honey_app_config.conf" "/var/log/honey_application.log" "/etc/honey_db_config.conf" "/home/honey_critical_data.pdf")

# Initialize total size variable
total_size=0

# Create a variable to store output
output="File sizes:\n"

# Loop through each file in the array
for file in "${files[@]}"
do
    # Check if the file exists
    if [ -f "$file" ]; then
        # Get the size of the file in bytes
        size=$(du -b "$file" | cut -f1)
        output+="$file: $size bytes\n"
        
        # Add file size to total size
        total_size=$((total_size + size))
    else
        output+="File not found: $file\n"
    fi
done

# Print file sizes
echo -e "$output"

# Print total size
echo "Total size of files: $total_size bytes"

