extends Control

var levels:Node2D = load("res://Scripts/Levels.tscn").instance()

func _ready():
	
	var i:int = 0
	for level in levels.get_children():
		if i/4 + 1 > $VBoxContainer.get_child_count(): #only 4 elements pr hbox, so if this loop
			var hBox:HBoxContainer = HBoxContainer.new() # has run more than that, then new hBox
			$VBoxContainer.add_child(hBox)
		
		var hBox:HBoxContainer = $VBoxContainer.get_child($VBoxContainer.get_child_count()-1) #current hBox
		
		#design
		$VBoxContainer.margin_left = $VBoxContainer.rect_size.x/25
		$VBoxContainer.margin_top = $VBoxContainer.rect_size.y/9
		$VBoxContainer.add_constant_override("separation", $VBoxContainer.rect_size.y/18)
		hBox.add_constant_override("separation", $VBoxContainer.rect_size.x/50)
		
		#then we make button
		var button := Button.new()
		button.rect_min_size = Vector2($VBoxContainer.rect_size.x/5,$VBoxContainer.rect_size.y/3)
		button.connect("pressed", self, "_button_pressed",[level])
		
		var butVBox := VBoxContainer.new()
		butVBox.alignment = 2
		butVBox.rect_min_size = button.rect_min_size
		butVBox.add_child(CenterContainer.new())
		butVBox.add_child(CenterContainer.new())
		
		butVBox.get_child(0).set_mouse_filter(1)
		butVBox.get_child(1).set_mouse_filter(1)
		
		var text := Label.new()
		text.text = level.get_name()
		text.rect_min_size.y = butVBox.rect_min_size.y/4
		if !level.unlocked: text.text += "\n\nprice: " + str(level.price)
		text.set_mouse_filter(1)
		
		butVBox.get_child(1).add_child(text)
		
		var textRect := TextureRect.new()
		var img := Image.new()
		var itex := ImageTexture.new()
		img.load("res://icon.png")
		itex.create_from_image(img)
		textRect.texture = itex
		textRect.set_mouse_filter(1)
		
		butVBox.get_child(0).add_child(textRect)
		
		button.add_child(butVBox)
		hBox.add_child(button)
		i += 1 #counter for state in loop (grrr gdscript)

func _button_pressed(level):
	if Global.coins >= level.price:
		level.unlocked = true
		Global.coins -= level.price
		
	if level.unlocked:
		Global.curLvl = level.get_name()
		get_tree().change_scene("res://Scripts/LevelPlayer.tscn")
		queue_free()
		
