import socket

host = socket.gethostname()
port = 3123

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((host, port))

msg = "Hello from client"
s.send(msg.encode())
msg = s.recv(1024)
print(msg.decode())

s.close()
