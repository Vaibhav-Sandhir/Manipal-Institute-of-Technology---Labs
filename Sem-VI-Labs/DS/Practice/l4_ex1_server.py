import socket

host = socket.gethostname()
port = 3123

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((host, port))
s.listen(5)

conn, addr = s.accept()

print(addr)

msg = conn.recv(1024)
print(msg.decode())
msg = "Server says hello"
conn.send(msg.encode())

conn.close()
s.close()
