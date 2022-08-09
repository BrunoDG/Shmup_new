extends Node2D

onready var health = 5
onready var points = 0
onready var fireDelayTimer = $FireDelayTimer

var p_bullet = load("res://scenes/P_bullet.tscn")
var is_alive = true
var type = "PLAYER"
var velocity = Vector2(0,0)
var currentControl = "MOUSE"
var rush_enemies = true

export (int) var speed = 10
export var fireDelay: float = 0.2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if currentControl == "KEYBOARD":
		self.position += velocity 
		keyboard_movement()
		if (Input.is_key_pressed(KEY_SPACE) and fireDelayTimer.is_stopped()):
			shoot_bullets()
	if currentControl == "MOUSE":
		self.position = get_global_mouse_position()
		if (Input.is_action_pressed("mouse_shoot")and fireDelayTimer.is_stopped()):
			shoot_bullets()

func shoot_bullets():
	fireDelayTimer.start(fireDelay)
	var b = p_bullet.instance()
	get_parent().add_child(b)
	b.position = self.position

func keyboard_movement():
	velocity = Vector2(0,0)
	if Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		velocity.x += 1
	if Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down") or Input.is_key_pressed(KEY_S):
		velocity.y += 1
	if Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_W):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func score():
	points += 1
	get_parent().get_node("points_label").text = "Points: " + str(points)

func advance_status():
	get_parent().get_node("health_label").text = "Health: " + str(health)

func die():
	is_alive = false
	self.queue_free()
	get_parent().get_node("game_over_label").text = "THE CREW HAS BEEN LOST\n\nFINAL SCORE: "+ str(points) +"\n\nPress 'shoot' to continue"
