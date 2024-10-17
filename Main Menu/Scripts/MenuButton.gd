extends Button

func _on_button_down():
	print("So you want to play " + text + ", do you?")
	
	get_tree().change_scene_to_file("res://" + text + "/Scenes/" + text.to_pascal_case() + ".tscn")
