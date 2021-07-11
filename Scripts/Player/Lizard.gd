extends Node2D

var direction:Vector2 = Vector2(0, 64)
var lastMove:Vector2 
var infants:int = 0
var fruitsEaten:int = 0
var dead:bool = false
var justDied:bool = false
var ButPos:Vector2
func _ready():
	$Body/Hat.texture = load("res://Assets/Hats/" + Global.cosmetics["hat"] + ".png")
	$Body/Color.set_modulate(Global.cosmetics["color"])
	var deathMenu:Control = load("res://Scripts/UI/DeathMenu.tscn").instance()
	deathMenu.visible = false
	deathMenu.set_name("deathMenu")
	self.get_parent().add_child(deathMenu)
	$Timer.start()

func _on_Timer_timeout():
	var bodyCount:int = $Body/Color.get_child_count()-1
	var head:Area2D = $Body/Color.get_child(0)
		
	#All bodyparts have to move one forward in the chain, and take the leading parts place
	for i in bodyCount:
		if i == bodyCount: pass #except the first
		if i == 0: ButPos = $Body/Color.get_child(bodyCount-i).get_position() #logging but position in case of death
		$Body/Color.get_child(bodyCount-i).set_position($Body/Color.get_child(bodyCount-i-1).get_position())
	head.set_position(head.get_position() + direction) #the first one shall guide to the new way
	$Body/Face.set_position($Body/Face.get_position() + direction) #and we want the face with us
	$Body/Face.set_rotation(direction.angle()-PI/2) #and turn that frown the right way up
	$Body/Hat.set_position($Body/Hat.get_position() + direction) #and  the hat
	$Body/Hat.set_rotation(direction.angle()-PI/2) 
	lastMove = direction
	
	#Just waiting two frames before checking stuff
	yield(get_tree(), "physics_frame")
	yield(get_tree(), "physics_frame")
	
	#If you have slammed head in a wall or a body, then you are dead, but if its an edible, then you are pregnant
	for area in head.get_overlapping_areas():
		if area.get_collision_layer_bit(0):
			death()
		elif area.get_collision_layer_bit(2):
			infants += area.nutrition
			fruitsEaten += area.value
			Global.currencies["coins"] += area.value
			area.queue_free()
			
	#Tilemaps are bodies and not areas
	for body in head.get_overlapping_bodies():
		if body.get_collision_layer_bit(1):
			death()
	
	if infants > 0: #if we're expecting, then a kid is born once every move
		var kid = load("res://Scripts/Player/BodyPart.tscn").instance()
		kid.set_position($Body/Color.get_child(bodyCount-1).get_position())
		$Body/Color.add_child(kid)
		infants -= 1
		
	if !dead: $Timer.start() #after everything is done, we go again
	
func _process(_delta): #input for movement
	var move:Vector2 = direction
	if Input.is_action_just_pressed("Up"):
		move = Vector2(0,-64)
		if justDied:
			$Timer.start()
	elif Input.is_action_just_pressed("Down"):
		move = Vector2(0,64)
		if justDied:
			$Timer.start()
	elif Input.is_action_just_pressed("Left"):
		move = Vector2(-64,0)
		if justDied:
			$Timer.start()
	elif Input.is_action_just_pressed("Right"):
		move = Vector2(64,0)
		if justDied:
			$Timer.start()
		
	if ! move == -lastMove: #if the player is stupid enough to go back the way they came
		direction = move #then we stop them from instantly committing suicide 
	
	
	
func death(): #if we die, then we load the death menu, gain coins equal to fruits gained and
	dead = true
	var deathMenu:Control = self.get_parent().get_node("deathMenu")#kills player
	deathMenu.get_node("ColorRect/VBoxContainer/HBoxContainer/Tekst").set_bbcode("[center] You died\n\n But you earned " + str(fruitsEaten) + " coins")
	deathMenu.visible = true
	$Timer.stop()
	
func respawn():
	dead = false
	justDied = true
	var bodyCount:int = $Body/Color.get_child_count()-1
	for i in bodyCount+1:
		if i == bodyCount: $Body/Color.get_child(i).set_position(ButPos) #except the last, that one is logged
		else: $Body/Color.get_child(i).set_position($Body/Color.get_child(i+1).get_position())
		print($Body/Color.get_child(i).get_position())
	$Body/Face.set_position($Body/Color.get_child(0).get_position())
	$Body/Hat.set_position($Body/Color.get_child(0).get_position())
