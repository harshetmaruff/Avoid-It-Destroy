extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var  middlepos = Vector2(1024/2, 600/2)


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()



func _process(delta):
	pass


func _on_Timer_timeout():
	
	var pos = get_position()
	
	if pos.y >= middlepos.y:
		$Timer.stop()
		return "Stop this machine"
	
	pos.y += 10
	$Timer.start()
	set_position(pos)
	
