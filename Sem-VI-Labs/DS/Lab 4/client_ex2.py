import socket

host = socket.gethostname()
port = 9992
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((host, port))

time = s.recv(1024)
print('Current time from server : ' + time.decode())
s.close()


