extends Control



func _on_Up_pressed():
	Input.action_press("Up")
	Input.action_release("Down")
	Input.action_release("Left")
	Input.action_release("Right")


func _on_Up_released():
	Input.action_release("Up")


func _on_Down_pressed():
	Input.action_release("Up")
	Input.action_press("Down")
	Input.action_release("Left")
	Input.action_release("Right")


func _on_Down_released():
	Input.action_release("Down")


func _on_Left_pressed():
	Input.action_release("Up")
	Input.action_release("Down")
	Input.action_press("Left")
	Input.action_release("Right")


func _on_Left_released():
	Input.action_release("Left")


func _on_Right_pressed():
	Input.action_release("Up")
	Input.action_release("Down")
	Input.action_release("Left")
	Input.action_press("Right")


func _on_Right_released():
	Input.action_release("Right")
