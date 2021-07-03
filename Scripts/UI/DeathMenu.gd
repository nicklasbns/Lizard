extends Control




func _on_Quit_pressed():
	get_tree().change_scene("res://Scripts/Menues/mainMenu.tscn")
	queue_free()
