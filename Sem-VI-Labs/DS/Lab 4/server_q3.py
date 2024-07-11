import socket

host = socket.gethostname()
port = 3134

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((host, port))
s.listen(5)
 
conn, addr = s.accept()
 
while True:
 	message = input("Enter Message to send => ")
 	conn.send(message.encode())
 	print("Server sent : " + message)
 	message = conn.recv(1024)
 	print("Server received : " + message.decode())
