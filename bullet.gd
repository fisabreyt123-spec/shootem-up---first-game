extends CharacterBody2D
class_name Bullet
var pos:Vector2
var rota:float
var dir:float
@export var speed= 700

func _ready():
	global_position=pos
	global_rotation=rota



func _physics_process(_delta: float):
	if global_position.y > 648 or global_position.y < 0 or global_position.x > 1152 or global_position.x < 0 :
		print("freed")
		queue_free()
	velocity=Vector2(speed, 0).rotated(dir)
	move_and_slide()
