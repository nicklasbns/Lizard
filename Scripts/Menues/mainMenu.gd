extends Control



func _on_Play_pressed(): #Goes to level select, when we wanna play
	var _change = get_tree().change_scene("res://Scripts/Menues/LevelSelect.tscn")
	queue_free()


func _on_Shop_pressed():
	var _change = get_tree().change_scene("res://Scripts/Menues/ShopMenu.tscn")
	queue_free()


func _on_Settings_pressed():
	var _change = get_tree().change_scene("res://Scripts/Menues/Settings.tscn")
	queue_free()
