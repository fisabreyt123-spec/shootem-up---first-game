extends CharacterBody2D
var pos:Vector2
var rota:float
var dir:float
var speed= 200

func _ready():
	global_position=pos
	global_rotation=rota

func _physics_process(delta: float):
	velocity=Vector2(speed, 0).rotated(dir)
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		print("Collision hit")
		queue_free()
