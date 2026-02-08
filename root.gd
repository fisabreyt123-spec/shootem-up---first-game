extends Node2D

var max_time = 3
var current_time = 0

#region Rnd spawn pos part 1 : define two points
@export var point_1: Vector2 = Vector2(0, 0)
@export var point_2: Vector2 = Vector2(1100, 600)
#endregion

#region Spawning enemy part 1 : Saving the enemy Blueprint
@onready var enemy_bp: Resource = preload("res://enemy.tscn")
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
	var spawn_location: Vector2 = get_random_point_inside(point_1, point_2)
	
	while spawn_location.x > 50 and spawn_location.x < 1050 and spawn_location.y > 50 and spawn_location.y < 550 :
		randomize()
		spawn_location = get_random_point_inside(point_1, point_2)
		print("Enemy position rerolled")
	
	enemy_instance.set_position(spawn_location)
	


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()

func gameover() :
	print("Game Over")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	max_time = randf_range(2, 5)
	current_time += delta
	if current_time > max_time:
		spawn_enemy()
		current_time = 0


func _on_player_player_deplected() -> void:
	gameover()
