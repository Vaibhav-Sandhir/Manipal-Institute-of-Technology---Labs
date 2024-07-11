import socket

host = socket.gethostname()
port = 3136

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((host, port))

currentTime = s.recv(1024)
print(currentTime.decode())
s.close()
