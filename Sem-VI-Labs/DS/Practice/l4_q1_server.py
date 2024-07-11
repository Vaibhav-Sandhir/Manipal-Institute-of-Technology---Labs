import socket
import time

host = socket.gethostname()
port = 3320

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind((host, port))

while True:
    data, addr = s.recvfrom(1024)
    currTime = time.ctime(time.time()) + "\r\n"
    s.sendto(currTime.encode('ascii'), addr)
    data, addr = s.recvfrom(1024)
    print(data)

s.close()