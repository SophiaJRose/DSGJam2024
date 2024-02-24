extends Area2D

signal levelExit
@export var trueDoor = false
var player = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player != null and Input.is_action_just_pressed("enter_door") and trueDoor:
		levelExit.emit()

func _on_body_entered(body):
	player = body

func _on_body_exited(body):
	player = null
