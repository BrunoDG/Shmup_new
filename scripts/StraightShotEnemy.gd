extends Node2D

onready var bullet_node = load("res://scenes/Bullet.tscn")

onready var player = get_parent().get_parent().get_node("Player")

var type = "ENEMY"

var health = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.set_wait_time(2)
	$Timer.start()
	
	var target = Vector2(position.x, 100)
	$Move_Tween.interpolate_property(self, "position", position, target, 2, Tween.TRANS_QUINT, Tween.EASE_OUT)
	$Move_Tween.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(delta)
	position.y += 50 * delta

func spawn_bullets():
	var b1 = bullet_node.instance()
	
	b1.position = self.position
	b1.dir = Vector2(player.position.x - self.position.x, player.position.y - self.position.y).normalized()
	b1.bullet_speed = 800
	
	get_parent().add_child(b1)
	

func timeout():
	spawn_bullets()

func die():
	self.queue_free()
