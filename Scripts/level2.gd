extends Node2D

var nextLevel = "res://Scenes/level1.tscn"
@onready var player = get_node("Player")
@export var startPos = Vector2(80, 432)

func _on_door_level_exit():
	get_tree().change_scene_to_file(nextLevel)


func _on_warp_barrier_body_entered(body):
	player.position = startPos
