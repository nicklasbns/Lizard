class_name Level

extends Node2D

export var size := [15,15]

export var fruitAmount:int = 1

export var unlocked:bool = true

export var price:int = 0

export(String, "coins") var currency = "coins"

var alreadyContinued:bool = false

var mapPos := []

var progress := [0,0]

var loaded:bool

var player:Node2D
func _ready():
	randomize() #It aint fun, if its always the same
	
	#We "load" the map by logging all posible positions
	var mapper:Area2D = load("res://Scripts/Tools/Mapper.tscn").instance()
	$Area2D.add_child(mapper)
	mapper.position = $Area2D.position
	progress[1] = size[0]
	for x in size[0]:
		for y in size[1]:
			mapper.position = Vector2(x*64,y*64)
			yield(get_tree(), "physics_frame")
			yield(get_tree(), "physics_frame")
			if mapper.get_collision_layer_bit(3):
				mapPos.push_back(mapper.position-$Area2D.position)
		progress[0] = x
	loaded = true
	self.get_parent().get_node("CenterContainer").queue_free()
	
	player = load("res://Scripts/Player/Lizard.tscn").instance()
	player.position = $Spawnpoint.position
	self.add_child(player)
	var fruit = Node2D.new()
	fruit.set_name("Fruits")
	self.add_child(fruit)
	
	
	self.visible = true
	
	
func _process(_delta):
	if loaded:
		if $Fruits.get_child_count() < fruitAmount: #If we don't have enough food, then we 
			var food:Area2D = load("res://Scripts/Fruit.tscn").instance() #add more
			food.set_position(randPos())
			
			while len(food.get_overlapping_areas()) > 0: #don't work, but should prevent
				food.set_position(randPos())   #food from spawning in player, but frame 
			$Fruits.add_child(food)   #detection is after two frames have passed so WIP
			
		
func randPos(): #returns a random vector2 in a grid based on the size of the map
	return Vector2(
			(randi() % (size[0]-2) -(size[0]-3)/2) *64,
			(randi() % (size[1]-2) -(size[1]-3)/2) *64
			)
