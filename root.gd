extends Node2D

var max_time = 1.5
var current_time = 0
var player_location: Vector2 = Vector2(576.0, 324.0)

#region Rnd spawn pos part 1 : define two points
@export var point_1: Vector2 = Vector2(50, 50)
@export var point_2: Vector2 = Vector2(1100, 600)
#endregion

#region Spawning enemy part 1 : Saving the enemy Blueprint
@onready var enemy_bp: Resource = preload("res://enemy.tscn")
@onready var player_bp: Resource = preload("res://player.tscn")
#endregion

#region rnd spawn pos part 2 : create Rnd function that will give a rnd pos in the scene
func get_random_point_inside(p1: Vector2, p2: Vector2) -> Vector2:
	var x_value: float = randf_range(p1.x, p2.x)
	var y_value: float = randf_range(p1.y, p2.y)

	var random_point_inside: Vector2 = Vector2(x_value, y_value)
	
	return(random_point_inside)
#region Spawning enemy part 2 : create the function
func spawn_enemy():
	var enemy_instance: Node = enemy_bp.instantiate()
	add_child(enemy_instance)
	
	#space to add further code here : the enemy "can" spawn IN the player so we will do a while loop to avoid that
	
	var spawn_location: Vector2 = get_random_point_inside(point_1, point_2)
	enemy_instance.set_position(spawn_location)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player_instance: Node = player_bp.instantiate()
	player_instance.set_position(player_location)
	add_child(player_instance)
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_time += delta
	if current_time > max_time:
		spawn_enemy()
		current_time = 0
