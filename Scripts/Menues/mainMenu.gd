extends Control



func _on_Play_pressed():
	get_tree().change_scene("res://Scripts/Menues/LevelSelect.tscn")
	queue_free()
