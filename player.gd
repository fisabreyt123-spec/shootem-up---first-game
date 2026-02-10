extends CharacterBody2D

signal player_deplected


var can_fire = true
var bullet_path=preload("res://bullet.tscn")
var bullet_fast_path=preload("res://bullet_fast.tscn")
var bullet_bomb_path=preload("res://bullet_bomb.tscn")
var start = true
var max_time = 0.1
#using max_time = 0.3 with buffs that will be added later
var current_time = 0
var player_location: Vector2 = Vector2(576.0, 324.0)

func _ready() -> void:
	add_to_group("player")


#Mouse-following movement function + Shoot command
func _physics_process(delta):
	look_at(get_global_mouse_position())
	
	current_time += delta
	if (Input.is_action_pressed("shoot")):
		if start == true:
			fire_normal()
			start = false
		if current_time > max_time and start == false:
			fire_normal()
			current_time = 0
	elif (Input.is_action_pressed("shoot_fast")):
		if start == true:
			fire_fast()
			start = false
		if current_time > max_time and start == false:
			fire_fast()
			current_time = 0
	elif (Input.is_action_pressed("shoot_bomb")):
		if start == true:
			fire_bomb()
			start = false
		if current_time > max_time and start == false:
			fire_bomb()
			current_time = 0

	

func fire_normal():
	if can_fire:
		var bullet=bullet_path.instantiate()
		bullet.dir=rotation
		bullet.pos=$Muzzle.global_position
		bullet.rota=global_rotation
		get_parent().add_child(bullet)
	

func fire_fast():
	if can_fire:
		var bullet_fast=bullet_fast_path.instantiate()
		bullet_fast.dir=rotation
		bullet_fast.pos=$Muzzle.global_position
		bullet_fast.rota=global_rotation
		get_parent().add_child(bullet_fast)
	
func fire_bomb():
	if can_fire:
		var bullet_bomb=bullet_bomb_path.instantiate()
		bullet_bomb.dir=rotation
		bullet_bomb.pos=$Muzzle.global_position
		bullet_bomb.rota=global_rotation
		get_parent().add_child(bullet_bomb)
	

func _on_hitbox_area_entered(_area: Area2D) -> void:
	player_deplected.emit()
	print("player dead")
	hide()
	can_fire = false
	
