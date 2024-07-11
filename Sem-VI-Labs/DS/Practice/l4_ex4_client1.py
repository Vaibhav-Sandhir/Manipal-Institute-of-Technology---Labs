import socket

host = socket.gethostname()
port = 3366

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((host, port))

msg = s.recv(1024)
print("Server : " + msg.decode())

while True:
	msg = input("Client : ")
	s.send(msg.encode())
	msg = s.recv(1024)
	print("Server : " + msg.decode())

	

