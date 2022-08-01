extends Node2D


var type = "PLAYER"

var health = 5

var p_bullet = load("res://scenes/P_bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position = get_global_mouse_position()
	
	if (Input.is_action_just_pressed("Shoot")):
		var b = p_bullet.instance()
		get_parent().add_child(b)
		b.position = self.position

func advance_status():
	get_parent().get_node("Label").text = get_parent().health_status[health]
