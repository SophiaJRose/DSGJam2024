extends Area2D

signal levelExit
@export var trueDoor = false
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

func _on_body_entered(body):
	player = body

func _on_body_exited(body):
	player = null
