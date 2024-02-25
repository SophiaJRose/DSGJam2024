extends Area2D

var player = null
@export var flashFadeTimer = 0
@export var flashDistance = 128
@export var sprite = "res://Assets/Key.png"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Sprite2D").set_texture(load(sprite))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player != null:
		position = player.position
		set_modulate(Color(1,1,1,1))

	if flashFadeTimer != 0:
		flashFadeTimer -= 1
	else:
		set_modulate(lerp(get_modulate(), Color(1,1,1,0), 0.05))

func _on_body_entered(body):
	player = body

func _on_player_flash(flashPosition):
	if global_position.distance_to(flashPosition) < flashDistance:
		flashFadeTimer = 15
		set_modulate(Color(1,1,1,1))
