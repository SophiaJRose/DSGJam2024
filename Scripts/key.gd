extends Area2D

var player = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player != null:
		position = player.position

func _on_body_entered(body):
	player = body
