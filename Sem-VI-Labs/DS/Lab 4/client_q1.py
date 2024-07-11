import socket

host = socket.gethostname()
port = 9993

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

message = "h"
s.sendto(message.encode(), (host, port))
time, addr = s.recvfrom(1024)

print('Current time from server : ' + time.decode())
s.close()
