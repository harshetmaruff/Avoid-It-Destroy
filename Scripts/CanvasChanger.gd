extends Node



var colorchanged = false
var colorchanging = false
var colornumber = 0.0
# Declare member variables here. Examples:
onready var canvas = $CanvasModulate
onready var timer = $Timer
onready var colortimer = $"Color Changing Timer"

# Called when the node enters the scene tree for the first time.
func _ready():
	canvas.set_color(Color(colornumber, colornumber, colornumber))
	set_process(true)
	timer.start()

func _on_Color_Changing_Timer_timeout():
	if not colorchanged:
		print('boo m')
		colornumber += 0.1
		if colornumber >= 1.0:
			timer.stop()
			colorchanged = true
			print(colornumber)
			print('go')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	canvas.set_color(Color(colornumber, colornumber, colornumber))
	if not colorchanged:
		if colorchanging:
			colorchanging = false
			colortimer.start()


func _on_Timer_timeout():
	colorchanging = true
	timer.stop() 
