extends Control



func _on_Play_pressed(): #Goes to level select, when we wanna play
	get_tree().change_scene("res://Scripts/Menues/LevelSelect.tscn")
	queue_free()


func _on_Shop_pressed():
	get_tree().change_scene("res://Scripts/Menues/ShopMenu.tscn")
	queue_free()
