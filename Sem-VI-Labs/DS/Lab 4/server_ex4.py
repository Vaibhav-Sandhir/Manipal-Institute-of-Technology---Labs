import socket
import os
from _thread import *

threadCount = 0
host = socket.gethostname()
port = 11597
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((host, port))
s.listen(3)

def threaded_client(connection, threadCount):
	connection.send(str.encode("Welcome to the server"))
	data = connection.recv(2048)
	print("Received from client:" + str(threadCount) + data.decode())
	msg = input("Server says : ")
	connection.sendall(msg.encode())
	connection.close()


while True:
	conn, addr = s.accept()
	start_new_thread(threaded_client, (conn, threadCount))
	threadCount += 1

s.close()			
