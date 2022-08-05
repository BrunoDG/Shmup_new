extends Node2D

var dir = Vector2(0,1)

export var bullet_speed = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position -= dir * delta * bullet_speed
	
	if ($RayCast2D.is_colliding()):
		var collid = $RayCast2D.get_collider().get_parent()
		if(collid.type == "ENEMY"):
			position += Vector2(-2000,-2000)
			
			if (collid.health > 0):
				collid.health -= 1
				if (collid.health == 0):
					collid.die()
	

func screen_exited():
	get_parent().remove_child(self)
	queue_free()
