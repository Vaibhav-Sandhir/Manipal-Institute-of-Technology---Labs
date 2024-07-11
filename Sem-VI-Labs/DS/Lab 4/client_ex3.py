import socket

host = socket.gethostname()
port = 31622
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((host, port))

name = input("Enter your name : ")
s.sendall(name.encode())
s_name = s.recv(1024)
s_name = s_name.decode()
print(s_name + ' has entered the chat room\n Enter [e] to exit\n')

while True:
	message = s.recv(1024)
	message = message.decode()
	print(s_name + ": " + message);
	message = input("Me: ")
	if message == "e":
		message = "Left Chat Room!"
		s.send(message.encode())
		break
	s.send(message.encode())	
