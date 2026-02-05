extends Node2D

#region Rnd spawn pos part 1 : define two points
@export var point_1: Vector2 = Vector2(50, 50)
@export var point_2: Vector2 = Vector2(1100, 600)
#endregion

#region Spawning enemy part 1 : Saving the enemy Blueprint
@onready var enemy_bp: Resource = preload("res://enemy.tscn")

#region rnd spawn pos part 2 : create Rnd function that will give a rnd pos in the scene
func get_random_point_inside(p1: Vector2, p2: Vector2) -> Vector2:
	var x_value: float = randf_range(p1.x, p2.x)
	var y_value: float = randf_range(p1.y, p2.y)

	var random_point_inside: Vector2 = Vector2(x_value, y_value)
	
	return(random_point_inside)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
