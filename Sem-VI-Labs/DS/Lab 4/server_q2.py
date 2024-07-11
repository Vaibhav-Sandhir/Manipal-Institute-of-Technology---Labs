import socket

host = socket.gethostname()
port = 31623
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind((host, port))

while True:
	data, addr = s.recvfrom(1024)
	print("Server Received : " + data.decode())
	message = input("Type some text to send => ")
	s.sendto(message.encode(), addr)
	print("Server sent : " + message)
