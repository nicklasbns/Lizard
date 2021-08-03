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

func _ready():
	Global._loadGame()
	#Fixin load of image after ad
	$VSplitContainer/Title.texture = load("res://Assets/Title.png")
	$VSplitContainer/HBoxContainer/CenterContainer/Play.set_button_icon(load("res://Assets/Play.png"))
	$VSplitContainer/HBoxContainer/CenterContainer2/Shop.set_button_icon(load("res://Assets/ShopIcon.png"))
	$Settings.set_button_icon(load("res://Assets/SettingsIcon.png"))
