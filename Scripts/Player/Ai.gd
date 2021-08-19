extends Control


var main
var level
var snake #the snake object
var fruits
var map = [] #the map i made
var mapPos = [] #the map mattias gives me
var pos = [-1, 2] #maptileindex, rotation
var time = 0 #throwaway time variable
var reset = [0, false] #when to stop pressing
var dir = ["Up", "Right", "Down", "Left"]
var action = 0 #what way do we turn?
var temp = 0
var font = load("res://assets/font.tres")

func _ready():
	main = self.get_parent().get_parent().get_parent().get_parent()
	level = main.get_child(4)
	snake = self.get_parent().get_child(0)
	fruits = level.get_child(3)
	print(fruits)
	mapPos = level.mapPos
	get_parent().get_parent().get_parent().get_child(6).modulate = Color(1, 1, 1, 0.3)
	get_parent().get_parent().get_child(1).connect("timeout", self, "step");

	for elem in mapPos:
		map.push_back([elem, -1, -1, -1, -1, 0])
		if map[-1][0].x == snake.get_child(0).position.x:
			if map[-1][0].y == snake.get_child(0).position.y:
				pos = [len(map)-1, 2]
			for i in len(snake.get_children()):
				if snake.get_child(i).position.y == map[-1][0].y:
					map[len(map)-1][5] = len(snake.get_children())-i
	for i in len(map):
		for j in len(map):
			if map[i][0].x == map[j][0].x:
				if map[i][0].y-64 == map[j][0].y:
					map[i][1] = j
				if map[i][0].y+64 == map[j][0].y:
					map[i][3] = j
			if map[i][0].y == map[j][0].y:
				if map[i][0].x-64 == map[j][0].x:
					map[i][4] = j
				if map[i][0].x+64 == map[j][0].x:
					map[i][2] = j
	#Input.action_press("Left")
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	time += _delta
	if reset[0] and reset[0]-time < -0.3:
		Input.action_release(reset[1])
		#print(reset[1])
		reset = [0, false]
	pass

func step(): # the main calculator
	var rotation = round(snake.get_child(0).rotation*2/PI)+2
	print(rotation)
	pos = [map[pos[0]][rotation+1], rotation]
	map[pos[0]][5] = len(snake.get_children())
	var diff = Vector2(0, 0)
	diff = fruits.get_children()[0].position-map[pos[0]][0]
	print(diff)
	# if abs(diff.x) > abs(diff.y):
	# 	if diff.x > 0:
	# 		go(1)
	# 	else:
	# 		go(3)
	# else:
	# 	if diff.y > 0:
	# 		go(2)
	# 	else:
	# 		go(0)
	self.update()

func _draw():
	self.draw_rect(Rect2(0, 0, 400, 400), Color(1), false)
	self.draw_line(Vector2(20, 20), 
				   Vector2(200, 20), Color(1, 0.4, 0.4))
	for i in map:
		self.draw_circle(i[0], 20, Color.from_hsv(i[5]*0.2, 1, 0.6))
		for j in 4:
			if i[j+1] != -1:
				self.draw_line(i[0], map[i[j+1]][0], Color(0.2, 0.7, 0.2))
		i[5] = max(i[5]-1, 0)  # fix when a fruit is eaten
	for part in snake.get_children():
		self.draw_circle(part.position, 10, Color(1, 0.4, 0.4))
	for i in map:
		self.draw_string(font, i[0], str(i[5]), Color(0xff))
	self.draw_rect(Rect2(map[pos[0]][0]+Vector2(-15, -15), Vector2(30, 30)), Color(0xff), true)
	# self.draw_rect(Rect2(-400, -400, 800, 800), Color(0xff), true)
	# self.draw_string(font, Vector2(0, 0), str()", 0")
	self.draw_line(Vector2(-500, -500), Vector2(-500, -500)+Vector2(50, 0).rotated(action*PI), Color(0xff), 2)
	pass

func djikstra():
	pass


func go(act:int):
	print(act)
	Input.action_press(dir[act])
	reset = [time, dir[act]]
