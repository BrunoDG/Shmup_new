extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var bullet_node = load("res://scenes/Bullet.tscn")

onready var player = get_parent().get_parent().get_node("Player")

var type = "ENEMY"
var is_alive = true
var health = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.set_wait_time(.6)
	$Timer.start()
	var target = Vector2(self.position.x, self.position.y + 100)
	$Move_Tween.interpolate_property(self, "position", position, target, 3, Tween.TRANS_QUINT, Tween.EASE_OUT)
	$Move_Tween.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(delta)
	position.y += 50 * delta

func spawn_bullets():
	var b1 = bullet_node.instance()
	b1.position = self.position
	b1.dir = Vector2(player.position.x - self.position.x, player.position.y - self.position.y).normalized()
	
	get_parent().add_child(b1)

func die():
	is_alive = false
	if(is_instance_valid(player)):
		player.score()
	self.queue_free()

func timeout():
	if(is_instance_valid(player)):
		spawn_bullets()
