from functools import reduce
from dateutil import parser
import threading
import datetime
import socket
import time

client_data = {}


# Threaded function to receive clock time from a connected client
def receiveClockTime(conn, addr):
	while True:
		clock_time = conn.recv(1024)
		clock_time = clock_time.decode()
		clock_time = parser.parse(clock_time)
		time_diff = datetime.datetime.now() - clock_time
		
		client_data[addr] = {
			"clock_time" : clock_time,
			"time_diff" : time_diff,
			"conn" : conn
		}
		
		time.sleep(5)
		
# Master Thread Function fr accepting many clients
def connect(master_socket):
	while True:
		slave_conn, addr = master_socket.accept()
		slave_addr = str(addr[0]) + ":" + str(addr[1])
		curr_thread = threading.Thread(target = receiveClockTime, args = (slave_conn, slave_addr))
		curr_thread.start()
		
# Fetch Average clock difference
def getAverageClockDiff():
	curr_client_data = client_data.copy()
	time_diff_list = []
	for client in client_data.values():
		time_diff_list.append(client['time_diff'])
	sum_clock_diff = sum(time_diff_list, datetime.timedelta(0, 0)) #2nd argument is start value of sum which is set to zero
	avg_clock_diff = sum_clock_diff / len(client_data)
	return avg_clock_diff
	
def synchronizeAll():
	while True:
		if(len(client_data) > 0):
			avg_clock_diff = getAverageClockDiff()
			for client in client_data.values():
				sync_time = datetime.datetime.now() + avg_clock_diff
				client['conn'].send(str(sync_time).encode())
		else:
			print("No client data")
		time.sleep(5)
		
def initiateClockServer(port = 8080):
	host = socket.gethostname()
	master_server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	master_server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1) 
	master_server.bind((host, port))
	master_server.listen(10)
	print("\nClock server started")
	master_thread = threading.Thread(target = connect, args = (master_server, ))
	master_thread.start()
	print("\nStarting synchronization parallely")
	sync_thread = threading.Thread(target = synchronizeAll, args = ())
	sync_thread.start()

if __name__ == '__main__':
	initiateClockServer(8080)	  					

