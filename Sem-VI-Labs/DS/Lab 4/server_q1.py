import socket
import time

host = socket.gethostname()
port = 9993

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

s.bind((host, port))

while True:
	data, addr = s.recvfrom(1024)
	currentTime = time.ctime(time.time()) + "\r\n"
	s.sendto(currentTime.encode('ascii'), addr)
	
s.close()	
