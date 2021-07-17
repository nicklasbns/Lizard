extends Control


func _draw():
	if Global.settings.leftHanded:
		$VBoxContainer/HBoxContainer/Lefthanded.pressed = true

func _on_Lefthanded_toggled(button_pressed):
	Global.settings.leftHanded = button_pressed
	Global._saveGame()
