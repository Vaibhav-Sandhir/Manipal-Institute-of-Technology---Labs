from timeit import default_timer as timer
from dateutil import parser
import threading
import datetime
import socket
import time

def startSendingTime(slave_client):
	while True:
		tm = str(datetime.datetime.now()).encode()
		slave_client.send(tm)
		print("Recent time sent successfully")
		time.sleep(5)

def startReceivingTime(slave_client):
	while True:
		sync_time = parser.parse(slave_client.recv(1024).decode())
		print("Synchronized time at the client is: " + str(sync_time))

def initiateSlaveClient(port = 8080):
	host = socket.gethostname()
	slave_client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	slave_client.connect((host, port))
	print("Starting to receive time from server\n") 
	send_time_thread = threading.Thread(target = startSendingTime, args = (slave_client, )) 
	send_time_thread.start()  
	receive_time_thread = threading.Thread(target = startReceivingTime, args = (slave_client, )) 
	receive_time_thread.start() 
	
if __name__ == '__main__': 
	initiateSlaveClient(port = 8080) 				 		 
