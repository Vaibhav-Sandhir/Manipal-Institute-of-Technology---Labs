import socket

host = socket.gethostname()
port = 3137

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((host, port))
s.listen(5)

conn, addr = s.accept()
c_name = conn.recv(1024)
c_name = c_name.decode()
print(c_name)
s_name = input("Enter your name: ")
conn.send(s_name.encode())
msg = ""

while msg != "q":
	msg = input("You : ")
	conn.send(msg.encode())
	msg = conn.recv(1024)
	print(c_name + " : " + msg.decode())

conn.close()
s.close()	
