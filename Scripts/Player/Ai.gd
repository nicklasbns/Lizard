extends Control



var level #to be used                    ----
var snake #the snake object
var main #to be used                     ----
var fruits = []
var map = [] #the map i made
var mapPos = [] #the map mattias gives me
var time = 0 #throwaway time variable
var reset = [0, false] #when to stop pressing
var dir = ["Up", "Right", "Down", "Left"]
var action = 0 #what way do we turn?
var temp = 0

func _ready():
	print(len(get_parent().get_parent().get_child(0).get_child(0).get_children()))
	snake = get_parent().get_parent().get_child(0).get_child(0)
	mapPos = get_parent().get_parent().get_parent().mapPos
	get_parent().get_parent().get_parent().get_child(6).modulate = Color(1, 1, 1, 0.3)
	get_parent().get_parent().get_child(1).connect("timeout", self, "readyDraw");

	for pos in mapPos:
		map.push_back([pos, -1, -1, -1, -1])
	for i in len(map):
		for j in len(map):
			if map[i][0].y == map[j][0].y:
				if map[i][0].x-64 == map[j][0].x:
					map[i][1] = j
				if map[i][0].x+64 == map[j][0].x:
					map[i][3] = j
			if map[i][0].x == map[j][0].x:
				if map[i][0].y-64 == map[j][0].y:
					map[i][2] = j
				if map[i][0].y+64 == map[j][0].y:
					map[i][4] = j
	#Input.action_press("Left")
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	time += _delta
	if reset[0] and reset[0]-time < -0.3:
		Input.action_release(reset[1])
		print(reset[1])
		reset = [0, false]
	pass

func readyDraw():
	temp += 1
	action = round(snake.get_child(0).rotation*2/PI)+2
	if temp == 3:
		go(action-1)
		temp = 0
	self.update()

func _draw():
	self.draw_rect(Rect2(0, 0, 400, 400), Color(1), false)
	self.draw_line(Vector2(20, 20), 
				   Vector2(200, 20), Color(1, 0.4, 0.4))
	for i in map:
		self.draw_circle(i[0], 20, Color(0.4, 0.4, 1))
		for j in 4:
			if i[j+1] != -1:
				self.draw_line(i[0], map[i[j+1]][0], Color(0.2, 0.7, 0.2))
	for part in snake.get_children():
		self.draw_circle(part.position, 10, Color(1, 0.4, 0.4))
	self.draw_line(Vector2(-500, -500), Vector2(-500, -500)+Vector2(50, 0).rotated(action*PI), Color(0xff), 2)
	pass


func go(act:int):
	Input.action_press(dir[act])
	reset = [time, dir[act]]
