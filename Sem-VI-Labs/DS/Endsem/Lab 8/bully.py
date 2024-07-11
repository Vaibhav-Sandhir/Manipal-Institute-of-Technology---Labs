import time
import random
nodes = ['P3', 'P4', 'P5', 'P1', 'P2', 'P7', 'P6']

def bully(coordinator, time_interval):
	print(coordinator + " is coordinating")
	curr_node = coordinator
	while curr_node == coordinator:
		curr_node = random.choice(nodes)
	print(curr_node + " sent a message to the corrdinator")
	time.sleep(time_interval)
	print("Time out , coordinator not able to respond")
	print(curr_node + " will hold election")
	candidates = [curr_node]
	done_nodes = set()
	
	while True:
		curr_node = candidates.pop()
		if curr_node in done_nodes:
			continue
		done_nodes.add(curr_node)
		print(curr_node + " is holding election")
		flag = True
		
		for node in nodes:
			if node > curr_node and node != coordinator:
				flag = False
				print(curr_node + " sends an ELECTION message to " + node)
				time.sleep(2)
				print(node + " sends an OK message")
				candidates.append(node)
		if flag:
			print(curr_node + " is the new coordinator")
			return curr_node
			break


if __name__ == "__main__":
	new_coordinator = bully("P2", 5)
						
			
