extends Area2D

@export var trueDoor = false

var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player != null and Input.is_action_just_pressed("enter_door") and trueDoor:
		print("Level Exit")

func _on_body_entered(body):
	player = body

func _on_body_exited(body):
	player = null
