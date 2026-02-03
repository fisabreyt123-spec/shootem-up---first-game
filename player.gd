extends CharacterBody2D
#hold the bullet scene for instancing
@export var Bullet : PackedScene
#Mouse-following movement function + Shoot command
func _physics_process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
		
#Shoot function that creates a bullet at Muzzle
func shoot():
	var b = Bullet.instantiate()
	add_child(b)
	b.transform = $Muzzle.transform
	
func save(content):
	var file = FileAccess.open("res://player.gd",FileAccess.WRITE)
	file.store_string(content)
	file = null
