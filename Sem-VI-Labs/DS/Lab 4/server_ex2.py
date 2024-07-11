import socket
import time

host = socket.gethostname()
port = 9992

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.bind((host, port))
s.listen(5)

while True:
	conn, addr = s.accept()
	print("Connection from " + str(addr))
	currentTime = time.ctime(time.time()) + "\r\n"
	conn.send(currentTime.encode('ascii'))
	conn.close()

s.close()	
