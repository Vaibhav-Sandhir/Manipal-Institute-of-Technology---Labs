import socket

serverIP = 'localhost'
serverPort = 16000
serverSock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
serverSock.bind((serverIP, serverPort))
serverSock.listen(1)
print("TCP Server has started and is ready to receive!")
connection, addr = serverSock.accept()
while True:
    data = connection.recv(1024)
    if not data: break
    temp = [float(x) for x in data.decode('utf-8').split(' ')] 
    print("Received data : ", temp) 
    length = len(temp)
    maximum = max(temp)
    minimum = min(temp)
    total = sum(temp)
    mean = total/length
    msg = str(total) + " " + str(minimum) + ' ' + str(maximum) + " " + str(mean)
    connection.send(str.encode(msg, 'utf-8'))
