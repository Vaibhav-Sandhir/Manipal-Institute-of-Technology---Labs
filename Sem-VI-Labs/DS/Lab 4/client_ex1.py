import socket

HOST = '127.0.0.1'
PORT = 12345

s = socket.socket(socket.AF_INET,socket.SOCK_STREAM);
s.connect((HOST, PORT))

message = input('Enter message to send to server: ')
s.sendall(message.encode())

data = s.recv(1024)
print('Received ' + data.decode() + ' at client')
s.close()
