extends CheckButton



func _on_CheckButton_toggled(button_pressed):
	Global.settings.leftHanded = button_pressed
