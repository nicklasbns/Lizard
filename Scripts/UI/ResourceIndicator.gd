extends Control

func _ready():
	self.anchor_left = 1 - $VBoxContainer/HBoxContainer.rect_size.x/1024
	self.anchor_top =  0.01

func _process(delta):
	$VBoxContainer/HBoxContainer/Label.text = str(Global.coins)
