extends KinematicBody2D


var motion = Vector2()
var facingdirection = Vector2()
# 22/1/2021
var hp = 50 
var Character
onready var sprite = $AnimatedSprite
var SPEED = 500
var friction = 0.1
const MAX_SPEED = 900
var animatingdirection
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
	animatingdirection = direction
# Called every frame. 'delta' is the elapsed time since the previous frame.

func animate_it():
	if animatingdirection:
		pass

func _process(delta):
	#var motion = get_position()
	if Input.is_action_pressed("PlayerUp") and not Input.is_action_pressed("PlayerDown"):
		move_it("Up")
		#motion.y -= SPEED
		motion.y = clamp(motion.y -SPEED, -MAX_SPEED, motion.y)
		
	elif Input.is_action_pressed("PlayerDown") and not Input.is_action_pressed("PlayerUp"):
		move_it("Down")
		#motion.y += SPEED
		motion.y = clamp(motion.y +SPEED, motion.y, MAX_SPEED)
		
	elif Input.is_action_pressed("PlayerLeft") and not Input.is_action_pressed("PlayerRight"):
		move_it("Left")
		#motion.x -= SPEED
		motion.x = clamp(motion.x -SPEED, -MAX_SPEED, motion.x)
		
	elif Input.is_action_pressed("PlayerRight") and not Input.is_action_pressed("PlayerLeft"):
		move_it("Right")
		#motion.x += SPEED
		motion.x = clamp(motion.x +SPEED, motion.x, MAX_SPEED)
		
	else:
		#motion.y = lerp(motion.y, 0, friction)
		#motion.x = lerp(motion.x, 0, friction)
		motion.x = 0
		motion.y = 0
	move_and_slide(motion)
	
