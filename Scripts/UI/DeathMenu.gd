extends Control


func _ready():
	if OS.get_name() == "Android" and !self.get_parent().alreadyContinued:
		$ColorRect/VBoxContainer/HBoxContainer2/Continue.visible = true
		$ColorRect/VBoxContainer/HBoxContainer2/Continue/AdMob.load_rewarded_video()

func _on_Quit_pressed(): #if you quit, then we go to the main menu
	var _change = get_tree().change_scene("res://Scripts/Menues/mainMenu.tscn")
	queue_free()


func _on_Continue_pressed():
	self.get_parent().get_node("Lizard").respawn()
	self.get_parent().get_parent().get_node("AdMob").show_rewarded_video()
