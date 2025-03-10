extends Area2D

var player = null
@export var sprite = "res://Assets/Key.png"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Sprite2D").set_texture(load(sprite))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player != null:
		position = player.position

func _on_body_entered(body):
	player = body
