extends Node2D

var enemy_node = load("res://scenes/Enemy.tscn")
var count = 0
var rush = false
onready var spawn_time: float = 2.0 

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.set_wait_time(spawn_time)
	$Timer.start()

func _process(_delta):
	if (count == 5 and rush == true and spawn_time > 0.5):
		rush()

func rush():
	spawn_time -= 0.1
	$Timer.set_wait_time(spawn_time)
	print("Enemies will appear at every " + str(spawn_time) + " seconds now!")
	count = 0
	rush = false

func timeout():
	var enemy = enemy_node.instance()
	randomize()
	enemy.position.x = rand_range(100,1000)
	enemy.position.y = -50
	add_child(enemy)
