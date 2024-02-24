extends Node2D

var nextLevel = "res://Scenes/level5.tscn"
var thisLevel = "res://Scenes/level4.tscn"

func _on_door_level_exit():
	get_tree().change_scene_to_file(thisLevel)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().change_scene_to_file(thisLevel)
