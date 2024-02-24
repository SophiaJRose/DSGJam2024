extends Area2D

signal levelExit
@export var trueDoor = false
@export var flashFadeTimer = 0
@export var flashDistance = 128
var player = null
var shakeTimer = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player != null and Input.is_action_just_pressed("enter_door") and trueDoor:
		levelExit.emit()
	if player != null and Input.is_action_just_pressed("enter_door") and !trueDoor:
		shakeTimer = 15
	if shakeTimer != 0:
		rotation_degrees = -10 + (5 * (shakeTimer % 5))
		shakeTimer -= 1
	else:
		rotation_degrees = 0

	if flashFadeTimer != 0:
		flashFadeTimer -= 1
	else:
		set_modulate(lerp(get_modulate(), Color(1,1,1,0), 0.05))

func _on_body_entered(body):
	player = body

func _on_body_exited(body):
	player = null

func _on_player_flash(flashPosition):
	if global_position.distance_to(flashPosition) < flashDistance:
		flashFadeTimer = 15
		set_modulate(Color(1,1,1,1))
