import socket

host = socket.gethostname()
port = 3320

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

data = 'd'
s.sendto(data.encode(), (host, port))
time, addr = s.recvfrom(1024)
data = 'eee'
s.sendto(data.encode(), addr)

print('Current time from server : ' + time.decode())
s.close()