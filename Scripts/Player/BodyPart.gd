extends Area2D

func _ready():
	var textRect := TextureRect.new()
	var img := Image.new()
	var itex := ImageTexture.new()
	img.load("res://Assets/Bodies/" + Global.body + ".png")
	itex.create_from_image(img)
	$Sprite.texture = itex
