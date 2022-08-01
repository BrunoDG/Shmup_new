extends Node2D

var health_status = [
	"THE CREW HAS BEEN LOST",
	"YOUR SHIP IS FALLING APART",
	"ALL SYSTEMS ARE FAILING",
	"YOUR SHIP HULL HAS BEEN BREACHED",
	"YOUR SHIP IS LIGHTLY DAMAGED",
	"YOUR SHIP IS AT FULL HEALTH"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
