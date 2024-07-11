import socket

host = socket.gethostname()
port = 11597
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((host, port))

msg = s.recv(1024)
print(msg)

while True:
	msg = input('Client : ')
	s.send(msg.encode())
	resp = s.recv(1024)
	print('From Server : ' + resp.decode())
	
s.close()
