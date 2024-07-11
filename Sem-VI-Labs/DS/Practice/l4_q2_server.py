import socket

host = socket.gethostname()
port = 3321

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind((host, port))

name = input("Enter your name : ")
client, addr = s.recvfrom(1024)
s.sendto(name.encode(), addr)
client = client.decode()

while True:
    message, addr = s.recvfrom(1024)
    print(client + ": " + message.decode())
    message = input(name + ": ")
    s.sendto(message.encode(), addr)    

s.close()