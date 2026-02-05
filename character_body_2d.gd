extends CharacterBody2D

var speed = 50
var player_path=preload("res://player.tscn")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group("player")
	var player_position = player.global_position
	global_position = global_position.move_toward(player_position, speed * delta)
	#var collision_info = move_and_collide(player_position * delta)
	#if collision_info:
	#	print("collided")
