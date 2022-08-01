extends Node2D

var dir = Vector2(0,1)

export var bullet_speed = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position -= dir * delta * bullet_speed
	
	

func screen_exited():
	get_parent().remove_child(self)
	queue_free()
