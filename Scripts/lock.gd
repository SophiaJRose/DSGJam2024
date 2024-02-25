extends Area2D

@export var sprite = "res://Assets/Lock.png"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Sprite2D").set_texture(load(sprite))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_entered(area):
	area.free()
	queue_free()
