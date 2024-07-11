import socket
from _thread import *

host = socket.gethostname()
port = 3366

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((host, port))
s.listen(3)
thread_count = 0


def threaded_client(conn, thread_count):
	msg = "Welcome to the server"
	conn.send(msg.encode())
	while True:
		msg = conn.recv(1024)
		print("Client" + str(thread_count) + " : " + msg.decode())
		msg = input("Server : ")
		if msg == "quit":
			break
		conn.send(msg.encode())
	conn.close()


while True:
	conn, addr = s.accept()
	print("Connected to : ", addr)
	start_new_thread(threaded_client, (conn, thread_count))
	thread_count += 1

s.close()				
