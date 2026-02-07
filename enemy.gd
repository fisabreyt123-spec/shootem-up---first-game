extends Area2D
var current_time = 0
var max_time = 0.1
var speed = 50
var player_path=preload("res://player.tscn")
var bullet_path=preload("res://bullet.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_time += delta
	var player = get_tree().get_first_node_in_group("player")
	var player_position = player.global_position
	global_position = global_position.move_toward(player_position, speed * delta)




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



func _on_body_entered(body: Node2D) -> void:
	if (body is Bullet):
		print("hit by bullet")
		queue_free()
		body.queue_free()
	else :
		print("hit by player")
		#body.queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is SZ :
		if current_time < max_time :
			print("SZ")
			queue_free()
