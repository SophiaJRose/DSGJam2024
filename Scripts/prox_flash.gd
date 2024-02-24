extends Node2D

@export var flashFadeTimer = 0
@export var flashDistance = 128

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if flashFadeTimer != 0:
		flashFadeTimer -= 1
	else:
		set_modulate(lerp(get_modulate(), Color(1,1,1,0), 0.05))

func _on_player_flash(flashPosition):
	if global_position.distance_to(flashPosition) < flashDistance:
		flashFadeTimer = 15
		set_modulate(Color(1,1,1,1))
