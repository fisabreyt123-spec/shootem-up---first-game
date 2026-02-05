extends CharacterBody2D
var bullet_path=preload("res://bullet.tscn")
var start = true
var max_time = 0.35
#using max_time = 0.3 with buffs that will be added later
var current_time = 0


#Mouse-following movement function + Shoot command
func _physics_process(delta):
	look_at(get_global_mouse_position())
	if (Input.is_action_pressed("shoot")):
		if start == true:
			fire()
			start = false
		current_time += delta
		print(current_time)
		if current_time > max_time and start == false:
			fire()
			current_time = 0
		

	

func fire():
	var bullet=bullet_path.instantiate()
	bullet.dir=rotation
	bullet.pos=$Muzzle.global_position
	bullet.rota=global_rotation
	get_parent().add_child(bullet)

		
		
