extends Node2D

var flashFadeTimer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if flashFadeTimer != 0:
		flashFadeTimer -= 1
	else:
		set_modulate(lerp(get_modulate(), Color(1,1,1,0), 0.05))


func _on_player_flash():
	flashFadeTimer = 15
	set_modulate(Color(1,1,1,1))
