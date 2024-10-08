class_name Player extends Area2D

var health: int = 100
var speed: int = 400
var armor: int = 1
var damage: int = 1
var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size
	
	
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		#$AnimatedSprite2D.play()
	else:
		#$AnimatedSprite2D.stop()
		pass
		
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	print(position)
	pass
