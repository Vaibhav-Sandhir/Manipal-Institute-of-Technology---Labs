# Basic point is client asks for the correct synchronised clock time from the server
# t0 is the time at which this request was made
# tserver is the clock time returned by the server
# t1 is the time at which client reveives tserver
# Final time for client is = tserver + (t1 - t0) / 2;
# t1 - t0 is process delay latency

import socket
import datetime
import time


def initiateClockServer():
	host = socket.gethostname()
	port = 8011
	s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	s.bind((host, port))
	s.listen(5)
	while True:
		conn, addr = s.accept()
		time = datetime.datetime.now()
		time = str(time)
		conn.send(time.encode())
	conn.close()

		
if __name__ == "__main__":
	initiateClockServer()	
