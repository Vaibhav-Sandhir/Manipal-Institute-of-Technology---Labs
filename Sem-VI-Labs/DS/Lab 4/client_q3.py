import socket

host = socket.gethostname()
port = 3134

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((host, port))

while True:
	message = s.recv(1024)
	print("Client received : " + message.decode())
	message = input("Enter message to be sent => ")
	s.send(message.encode())
	print("Client sent : " + message)
