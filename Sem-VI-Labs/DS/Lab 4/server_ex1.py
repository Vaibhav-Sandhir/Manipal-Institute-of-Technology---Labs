import socket

HOST = '127.0.0.1'
PORT = 12345

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM, 0)
s.bind((HOST, PORT))
s.listen()

conn, addr = s.accept()
data = conn.recv(1024)
print('Received ' + data.decode() + ' at server')
conn.sendall(data)

conn.close()

