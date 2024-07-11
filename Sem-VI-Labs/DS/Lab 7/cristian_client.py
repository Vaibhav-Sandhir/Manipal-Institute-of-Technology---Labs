# Basic point is client asks for the correct synchronised clock time from the server
# t0 is the time at which this request was made
# tserver is the clock time returned by the server
# t1 is the time at which client reveives tserver
# Final time for client is tclient = tserver + (t1 - t0) / 2;
# t1 - t0 is process delay latency

import socket
import datetime
from dateutil import parser
from timeit import default_timer as timer

def connectTo(host, port):
	s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	s.connect((host, port))
	return s

def synchronizeTime(s):
	t0 = timer()
	tserver = s.recv(1024).decode()
	tserver = parser.parse(tserver) # Convert tserver which is a string to datetime obj
	t1 = timer()
	tactual = datetime.datetime.now()
	diff = datetime.timedelta(seconds = (t1 - t0))
	tclient = tserver + diff / 2
	error = tactual - tclient
	return tclient, tactual

if __name__ == "__main__":
	host = socket.gethostname()
	port = 8022
	s = connectTo(host, port)
	tclient, tactual = synchronizeTime(s)
	print(str(tclient) + "\n" + str(tactual))			
