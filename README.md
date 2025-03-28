# Honey-in-Depth

Honey-in-Depth is an advanced **multi-layered deception framework** designed to enhance security through **honeytokens**—fake assets strategically deployed across various Defense-in-Depth layers. These honeytokens deceive potential intruders and trigger alerts upon unauthorized access, helping you proactively detect threats.

## Overview: Deception-in-Depth Layers and Honeytokens

<img width="1317" alt="Screenshot 2025-03-28 at 2 46 33 pm" src="https://github.com/user-attachments/assets/f4a03be5-978b-41dc-8c15-559e38f58f79" />

#### Explanation

The honeytokens are deployed in the following Defence-in-Depth layers:

- **Physical Layer**: Simulated physical security assets
  - e.g., fake RFID tags, QR codes
- **Perimeter Layer**: Imitated perimeter security configurations
  - e.g., fake firewall rules, VPN endpoints
- **Internal Network Layer**: Network-related honeytokens
  - e.g., decoy network shares, fake routing tables
- **Host Layer**: Host-level honeytokens
  - e.g., dummy credential files, fake system logs
- **Application Layer**: Application-related honeytokens
  - e.g., fake API keys, decoy configuration files
- **Data Layer**: Data layer honeytokens
  - e.g., fake database entries, decoy sensitive files

## Features

- **Deployment of Honeytokens**: Creates fake objects (honeytokens) across multiple layers.
- **Real-Time Monitoring**: Continuously monitors the honeytokens for unauthorized access.
- **Event Logging**: Logs unauthorized access events with relevant details.
- **Cleanup**: Automatically removes all honeytokens when the monitoring is stopped.

## Requirements

- **Operating System**: Ubuntu 22.04
- **Python**: Version 3.x
- **Libraries**: Watchdog
- **Privileges**: Root privileges are required for deploying and removing honeytokens

## Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/honey-in-depth.git
cd honey-in-depth
```

2. Ensure you have Python 3 installed. You can check the version with:

```bash
sudo apt install python3-pip
python3 --version
```
3. Install `watchdog` (Python API library and shell utilities to monitor file system events).

```bash
pip install watchdog
```

The script requires root privileges. Run the scripts using sudo.

## Usage

### Deploy and Monitor Honeytokens

- To deploy the honeytokens and start monitoring them:

```bash
sudo python3 hid.py
```

- This command will deploy the honeytokens and start monitoring them for unauthorized access. 
- The monitoring will run indefinitely until you stop it with `Ctrl+C`.


### Simulate Unauthorized Access

- To test the HID system, simulate unauthorized access by running the test script:

```bash
bash test_hid.sh
```

- This script simulates unauthorized access to each honeytoken, triggering alerts in the Honey-in-Depth system.

### Calculate Storage

- To calculate the storage capacity of deployed honeytokens:

```bash
bash file_storage.sh
```

- This script calculates storage capacity occupied by deployed honeytokens.

### Calculate CPU and Memory Usage
- To calculate the CPU and Memory usage when honey-in-depth is running:

```bash
bash cpu_mem_usage.sh
```

- This script evaluates system performance while Honey-in-Depth is running.

### Stop Monitoring and Cleanup

- To stop monitoring and remove all deployed honeytokens, simply press `Ctrl+C` in the terminal where the Honey-in-Depth script is running. The system will clean up all honeytokens:


- It will automatically remove all deployed honeytokens, ensuring no interference with system performance.

## Project Structure

```
honey-in-depth/
├── hid.py                  # Main script for deploying and monitoring honeytokens
├── test_hid.sh             # Testing unauthorized access simulation
├── file_storage.sh         # Calculating the storage capacity of deployed honeytokens 
├── cpu_mem_usage.sh        # Evaluvating the CPU and Memory usage of honey-in-depth
└── README.md               # Project documentation
```

## Published Research
The **Honey-in-Depth** framework was presented at the **2024 7th International Conference on Information and Communications Technology (ICOIACT)** and published as a research conference paper. Read more here:<br>

<a href="https://ieeexplore.ieee.org/abstract/document/10913376">Honey in Depth: A Multi-Layered Deception Framework for Internet of Things Security</a>

## License
This project is licensed under the MIT License. Feel free to modify and use it in your security research.







