import socket

host = socket.gethostname()
port = 31622
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.bind((host, port))
s.listen(5)

conn, addr = s.accept()

s_name = conn.recv(1024)
s_name = s_name.decode()
print(s_name + ' has entered the chat room\n Enter [e] to exit\n')
name = input("Enter your name : ")
conn.send(name.encode())

while True:
	message = input("Me : ")
	if message == "e":
		message = "Left Chat Room"
		conn.send(message.encode())
		break
	conn.send(message.encode())
	message = conn.recv(1024)
	message = message.decode()
	print(s_name + ":" + message);
			
