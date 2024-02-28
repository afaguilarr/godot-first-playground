extends Sprite2D

signal attack_received

var speed = 400*.3
var angular_speed = PI
var current_texture = "godot"
var timer

func _init() -> void:
	print("Hello, world!")
	
func _ready() -> void:
	timer = get_node("Timer")
	
func _process(delta):
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction = -1
	if Input.is_action_pressed("ui_right"):
		direction = 1
	rotation += angular_speed * direction * delta
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * speed
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2.UP.rotated(rotation) * -speed
	position += velocity * delta
	
	if Input.is_action_pressed("ui_accept"):
		start_timer()
		
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			attack_received.emit()
	
func toggleVisibility() -> void:
	visible = not visible
	
func toggle_texture() -> void:
	var txture
	if current_texture == "PAPI":
		return
	elif current_texture == "saity":
		current_texture = "godot"
		txture = load("res://icon.svg")
	else:
		current_texture = "saity"
		txture = load("res://asd.webp")
	set_texture(txture)
	
func die() -> void:
	current_texture = "PAPI"
	var txture = load("res://PAPI.webp")
	set_texture(txture)
	
func start_timer():
	timer.start()
