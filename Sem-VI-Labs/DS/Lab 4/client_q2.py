import socket

host = socket.gethostname()
port = 31623

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

while True:
	message = input("Type some text to send => ")
	s.sendto(message.encode(), (host, port))
	print("Client sent : " + message)
	data, addr = s.recvfrom(1024)
	print("Client received : " + data.decode())


