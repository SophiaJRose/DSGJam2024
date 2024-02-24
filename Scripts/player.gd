extends CharacterBody2D

signal flash(flashPosition)

@export var walkSpeed = 384
@export var jumpSpeed = 720
@export var risingGrav = 32
@export var fallingGrav = 64

enum state {
	STAND,
	WALK,
	JUMP
}
var playerState = state.STAND

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.x = 0
	if is_on_floor():
		playerState = state.STAND
	if Input.is_action_pressed("move_right"):
		velocity.x += walkSpeed
	if Input.is_action_pressed("move_left"):
		velocity.x -= walkSpeed
	if playerState == state.STAND and velocity.x != 0:
		playerState = state.WALK
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= jumpSpeed
		playerState = state.JUMP
	if velocity.y <= 0 and !Input.is_action_pressed("jump"):
		velocity.y /= 2
	if velocity.y <= 0 and Input.is_action_pressed("jump"):
		velocity.y += risingGrav
	else:
		velocity.y += fallingGrav
		
	if Input.is_action_just_pressed("flash"):
		flash.emit(position)
	
	move_and_slide()
