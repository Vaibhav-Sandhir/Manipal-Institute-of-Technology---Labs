import socket
import time

host = socket.gethostname()
port = 3136

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((host, port))
s.listen(5)

while True:
	conn, addr = s.accept()
	currentTime = time.ctime(time.time())
	conn.send(currentTime.encode('ascii'));
	conn.close()
