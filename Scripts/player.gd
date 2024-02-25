extends CharacterBody2D

signal flash(flashPosition)
@export var walkSpeed = 256
@export var jumpSpeed = 736
@export var risingGrav = 32
@export var fallingGrav = 64
var direction = false # true is left, false is right
@onready var animations = get_node("AnimatedSprite2D")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += walkSpeed
		direction = false
	if Input.is_action_pressed("move_left"):
		velocity.x -= walkSpeed
		direction = true
	if is_on_floor() and velocity.x == 0:
		animations.play("Stand")
	if is_on_floor() and velocity.x != 0:
		animations.play("Walk")
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= jumpSpeed
		animations.play("Jump")
	if velocity.y <= 0 and !Input.is_action_pressed("jump"):
		velocity.y /= 2
	if velocity.y <= 0 and Input.is_action_pressed("jump"):
		velocity.y += risingGrav
	else:
		velocity.y += fallingGrav
		
	if Input.is_action_just_pressed("flash"):
		flash.emit(position)
	
	move_and_slide()
	
	if direction:
		animations.scale.x = -1
	else:
		animations.scale.x = 1
