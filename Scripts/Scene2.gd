extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dialogposition = Vector2(1024/2, 460)
export (PackedScene) var dialogbar
var dialognumber = 0
var jsjsj


# Called when the node enters the scene tree for the first time.
func _ready():
	print(dialogposition)
	var dialogbars = dialogbar.instance()
	dialogbars.set_position(dialogposition)
	add_child(dialogbars)
	jsjsj = get_json_as_text("Dialogs/OpeningScene2.json")
	get_tree().call_group("DialogSystem", "displaydialog", jsjsj, dialognumber)
	set_process(true)

func get_json_as_text(filename):
	var file = File.new()
	file.open(filename, File.READ)
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	return data
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if not dialognumber == len(jsjsj) - 1:
			dialognumber += 1
			get_tree().call_group("DialogSystem", "displaydialog", jsjsj, dialognumber)
