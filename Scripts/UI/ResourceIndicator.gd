extends Control
export var scale:Vector2 = Vector2(2,2)


func _process(_delta): #indicate how many coins we have
	$VBoxContainer/HBoxContainer.rect_size.x = str(Global.currencies["coins"]).length()*16 +68
	self.anchor_left = 1 - $VBoxContainer/HBoxContainer.rect_size.x/1024
	self.anchor_top =  0.01
	if self.get_parent().get_name() =="Camera2D": #if in game
		self.rect_scale = scale
		self.rect_position = Vector2(
				512*scale.x - $VBoxContainer/HBoxContainer.rect_size.x*scale.x,
				-(300*scale.y) + 0.01
			)
	$VBoxContainer/HBoxContainer/Label.text = str(Global.currencies["coins"])
