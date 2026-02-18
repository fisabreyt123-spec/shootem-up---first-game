extends Area2D
@export var speed = 100
var player_path=preload("res://player.tscn")
var bullet_path=preload("res://bullet.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group("player")
	var player_position = player.global_position
	global_position = global_position.move_toward(player_position, speed * delta)




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



func _on_body_entered(body: Node2D) -> void:
	if (body is Bullet or Bullet_fast or Bullet_bomb):
		queue_free()
		body.queue_free()
