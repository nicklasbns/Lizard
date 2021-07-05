extends TextureButton

export var previousScenePath:String


func _on_BackArrow_pressed():
	var _change = get_tree().change_scene(previousScenePath)
	queue_free()
