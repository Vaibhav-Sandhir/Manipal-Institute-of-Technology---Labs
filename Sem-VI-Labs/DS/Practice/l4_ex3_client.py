import socket

host = socket.gethostname()
port = 3137

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((host, port))

c_name = input("Enter your name: ")
s.send(c_name.encode())
s_name = s.recv(1024)
s_name = s_name.decode()
msg = ""

while msg != "q":
	msg = s.recv(1024)
	print(s_name + " : " + msg.decode())
	msg = input("You : ")
	s.send(msg.encode())


s.close()	
	

