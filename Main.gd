extends Control



func _on_Create_pressed():
	Network.create_server()

func _on_Join_pressed():
	Network.join_server()
	rpc("print_connect")

func _on_Send_pressed():
	Network.call_peer("Main", "set_text", $TextEdit.text)
	#rpc("set_text", $TextEdit.text)

func run_server_func(function, data):
	if function == "set_text":
		set_text(data)

func set_text(text):
	$TextEdit.text = text

#remote func print_connect():
	#print("Connection")
