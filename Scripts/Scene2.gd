extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dialogposition = Vector2(1024/2, 460)
export (PackedScene) var dialogbar



# Called when the node enters the scene tree for the first time.
func _ready():
	print(dialogposition)
	var dialogbars = dialogbar.instance()
	dialogbars.set_position(dialogposition)
	add_child(dialogbars)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
