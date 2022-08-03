extends Node2D

var type = "PLAYER"
var health = 5
var p_bullet = load("res://scenes/P_bullet.tscn")
var is_alive = true

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

func die():
	is_alive = false
	self.queue_free()
	get_parent().get_node("Label").text += "\n\nPress any key to continue"
