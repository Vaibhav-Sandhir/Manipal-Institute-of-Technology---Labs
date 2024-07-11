import time
import random
nodes = ['P3', 'P4', 'P5', 'P1', 'P2', 'P7', 'P6']

def bully(coordinator, time_interval):
	index = nodes.index(coordinator)
	print(coordinator + " is coordinating")
	curr_node = coordinator
	while curr_node == coordinator:
		curr_node = random.choice(nodes)
	curr_ind = nodes.index(curr_node)
	print(curr_node + " has sent a message to coordinator")
	time.sleep(time_interval)
	print(coordinator + " crashed")
	print("Time interval expired therefore " + curr_node + " will hold election")
	candidates = [curr_node]
	while True:
		curr_node = candidates.pop()
		print(curr_node + " is holding election")
		flag = True
		for node in nodes:
			if node > curr_node and node != coordinator:
				flag = False
				print(curr_node + " sends an ELECTION message to " + node)
				time.sleep(2)
				print(node + " sent an OK message to " + curr_node)
				candidates.append(node)
		if flag:
			print(curr_node + " is the new coordinator")
			return curr_node
			break

def main():
	new_coordinator = bully('P2', 5);

if __name__ == '__main__':
	main()					
					
				
