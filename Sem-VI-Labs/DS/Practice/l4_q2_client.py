import socket

host = socket.gethostname()
port = 3321

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
addr = (host, port)

name = input('Enter your name : ')
s.sendto(name.encode(), addr)
server, addr = s.recvfrom(1024)
server = server.decode()

while True:
    message = input(name + ": ")
    s.sendto(message.encode(), addr)
    message, addr = s.recvfrom(1024)
    print(server + ": " + message.decode())

s.close()