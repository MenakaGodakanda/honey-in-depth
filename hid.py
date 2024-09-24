import os
import time
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
from datetime import datetime

def get_timestamp():
    return datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f")[:-3]

class HoneytokenHandler(FileSystemEventHandler):
    def __init__(self, honeytokens):
        self.last_alert_time = {}
        self.honeytokens = honeytokens

    def on_any_event(self, event):
        if event.src_path not in self.honeytokens:
            return

        current_time = time.time()
        if event.src_path in self.last_alert_time:
            if current_time - self.last_alert_time[event.src_path] < 1:  # 1 second debounce
                return

        self.last_alert_time[event.src_path] = current_time
        layer = self.honeytokens[event.src_path]['layer']
        print(f"[{get_timestamp()}] [ALERT] [Layer: {layer}] Honeytoken accessed - {event.src_path}")

class HID:
    def __init__(self):
        self.honeytokens = {}
        self.observer = Observer()

    def create_honeytokens(self):
        layers = {
            "Physical": [("/tmp/honey_usb_drive", "Fake USB drive mount folder"),
                         ("/tmp/honey_device_log.log", "Fake log of physical device usage")],
            "Perimeter": [("/etc/honey_firewall_rules.conf", "Fake firewall configuration"),
                          ("/etc/honey_vpn_config.ovpn", "Fake VPN configuration file")],
            "Internal Network": [("/etc/honey_network_config.cfg", "Fake network configurations"),
                                 ("/var/log/honey_network_traffic.log", "Fake log of network traffic")],
            "Host": [("/etc/honey_passwd", "Fake password file entry"),
                     ("/var/log/honey_process.log", "Fake process configurations or logs")],
            "Application": [("/opt/honey_app_config.conf", "FFake application configuration file"),
                            ("/var/log/honey_application.log", "Fake application logs")],
            "Data": [("/etc/honey_db_config.conf", "Fake database configuration file"),
                     ("/home/honey_critical_data.pdf", "Fake critical data")]
        }

        for layer, tokens in layers.items():
            for path, content in tokens:
                self.honeytokens[path] = {'layer': layer, 'content': content}

    def deploy_honeytokens(self):
        handler = HoneytokenHandler(self.honeytokens)
        for path, info in self.honeytokens.items():
            with open(path, 'w') as f:
                f.write(info['content'])
            print(f"[{get_timestamp()}] [DEPLOY] [Layer: {info['layer']}] Deployed honeytoken: {path}")
            self.observer.schedule(handler, path=path, recursive=False)

    def monitor_honeytokens(self):
        self.observer.start()
        try:
            while True:
                time.sleep(1)
        except KeyboardInterrupt:
            self.observer.stop()
        self.observer.join()

    def cleanup_honeytokens(self):
        for path, info in self.honeytokens.items():
            if os.path.exists(path):
                os.remove(path)
                print(f"[{get_timestamp()}] [REMOVE] [Layer: {info['layer']}] Removed honeytoken: {path}")

def main():
    hid = HID()
    print(f"[{get_timestamp()}] [INFO] Honey-in-Depth system is starting...")
    print(f"[{get_timestamp()}] [INFO] Honey-in-Depth system is creating and deploying honeytokens...")
    hid.create_honeytokens()
    hid.deploy_honeytokens()
    
    print()
    print(f"[{get_timestamp()}] [INFO] Honey-in-Depth system is now monitoring. Press Ctrl+C to stop...")
    try:
        hid.monitor_honeytokens()
    finally:
    	print()
    	print(f"[{get_timestamp()}] [INFO] Honey-in-Depth system is stopping and cleaning up the honeytokens...")
    	hid.cleanup_honeytokens()
    	print(f"[{get_timestamp()}] [INFO] All honeytokens cleaned up...")

if __name__ == "__main__":
    main()
