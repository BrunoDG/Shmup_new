extends Node2D

# var health_status = [
#	"THE CREW HAS BEEN LOST",
#	"YOUR SHIP IS FALLING APART",
#	"ALL SYSTEMS ARE FAILING",
#	"YOUR SHIP HULL HAS BEEN BREACHED",
#	"YOUR SHIP IS LIGHTLY DAMAGED",
#	"YOUR SHIP IS AT FULL HEALTH"
#]

onready var player = load("res://scenes/Player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_node("health_label").text = "Health: 5"
	get_node("points_label").text = "Points: 0"
	
func _process(delta):
	if (get_node_or_null("Player") == null):
		_restart_game()
	
func _restart_game():
	if(Input.is_mouse_button_pressed(BUTTON_LEFT) or Input.is_key_pressed(KEY_SPACE)):
		print("Restarting the game...")
		get_tree().reload_current_scene()
		queue_free()
