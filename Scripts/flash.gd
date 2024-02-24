extends Node2D

@export var flashFadeTimer = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if flashFadeTimer != 0:
		flashFadeTimer -= 1
	else:
		set_modulate(lerp(get_modulate(), Color(1,1,1,0), 0.05))

func _on_player_flash(flashPosition):
	flashFadeTimer = 15
	set_modulate(Color(1,1,1,1))
