extends Node

const DEFAULT_IP = "73.103.57.90"
const DEFAULT_PORT = 31400
const MAX_CLIENTS = 2

func create_server():
	print("Create")
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(DEFAULT_PORT, MAX_CLIENTS)
	get_tree().set_network_peer(peer)

func join_server():
	print("Join")
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(DEFAULT_IP, DEFAULT_PORT)
	get_tree().set_network_peer(peer)

func call_peer(node_path, function, data):
	print("Call")
	rpc("recive_call", node_path, function, data)

remote func recive_call(node_path, function, data):
	print("Got Call")
	get_tree().get_root().get_node(node_path).run_server_func(function, data)
