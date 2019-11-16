extends Area2D

var speed

func _ready():
	speed = randi() % 200 + 300

func _process(delta):
	position.y += speed * delta
	if (position.y > 720):
		queue_free()

func _on_SpeedUp_body_entered(body):
	global.playerSpeed += 25
	if (global.playerSpeed > 650):
		global.playerSpeed = 650
		get_tree().get_current_scene().removeSpeed()
	queue_free()
