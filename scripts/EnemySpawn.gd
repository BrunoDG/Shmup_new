extends Node2D

var enemy_node = load("res://scenes/ENemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.set_wait_time(2)
	$Timer.start()


func timeout():
	var enemy = enemy_node.instance()
	randomize()
	enemy.position.x = rand_range(100,1000)
	enemy.position.y = -50
	add_child(enemy)
