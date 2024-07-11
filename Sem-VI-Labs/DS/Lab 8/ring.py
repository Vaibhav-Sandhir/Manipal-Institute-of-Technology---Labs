import random
nodes = ['P3', 'P4', 'P5', 'P1', 'P2', 'P7', 'P6']

def ring(coordinator):
	print(coordinator + " is coordinating")
	ind_coordinator = nodes.index(coordinator)
	curr_node = coordinator
	while curr_node == coordinator:
		curr_node = random.choice(nodes)
	print(curr_node + " notices coordinator has failed")
	candidates = [curr_node]
	start = nodes.index(curr_node)
	n = len(nodes)
	i = ind + 1
	while i != start:
		if nodes[i] != coordinator:
			print(nodes[i - 1] + " sent ELECTION message to " + nodes[i])
			candidates.append(nodes[i])
	new_coordinator = max(nodes)
	print(new_coordinator + " is the coordinator")
	
if __name__ == "__main__":
	ring("P4")						
