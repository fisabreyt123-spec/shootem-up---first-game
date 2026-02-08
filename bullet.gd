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
	velocity=Vector2(speed, 0).rotated(dir)
	move_and_slide()
