extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var namelab = $Label
onready var dialogname = $RichTextLabel
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("DialogSystem")

func displaydialog(Dialogs, number):
	namelab.set_text(Dialogs[number].name)
	dialogname.set_text(Dialogs[number].dialog)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
