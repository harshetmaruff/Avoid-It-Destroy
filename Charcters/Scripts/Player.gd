extends KinematicBody2D


var motion = Vector2()
var facingdirection = Vector2()
# 22/1/2021
var hp = 50 
var Character
onready var sprite = $AnimatedSprite


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	facingdirection.x = 0
	facingdirection.y = 1
	print(facingdirection)

func move_it(direction):
	if direction == "Up":
		facingdirection.y = -1
		facingdirection.x = 0
	if direction == "Down":
		facingdirection.y = 1
		facingdirection.x = 0
	if direction == "Left":
		facingdirection.y = 0
		facingdirection.x = -1
	if direction == "Right":
		facingdirection.y = 0
		facingdirection.x = 1
	print(direction)
	print(facingdirection)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	var the_current_pos = get_position()
	if Input.is_action_pressed("PlayerUp") and not Input.is_action_pressed("PlayerDown"):
		move_it("Up")
	if Input.is_action_pressed("PlayerDown") and not Input.is_action_pressed("PlayerUp"):
		move_it("Down")
	if Input.is_action_pressed("PlayerLeft") and not Input.is_action_pressed("PlayerRight"):
		move_it("Left")
	if Input.is_action_pressed("PlayerRight") and not Input.is_action_pressed("PlayerLeft"):
		move_it("Right")
