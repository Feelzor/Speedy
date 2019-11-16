extends Area2D

var speed

func _ready():
	speed = randi() % 200 + global.enemyBaseSpeed

func _process(delta):
	position.y += speed * delta
	if (position.y > 720):
		queue_free()
		var scoreNode = get_tree().get_current_scene().get_node("Score")
		var score = int(scoreNode.get_text()) + 1
		scoreNode.set_text(str(score))
	
		get_tree().get_current_scene().increaseDifficulty()

func _on_Enemy_body_entered(body):
	get_tree().get_current_scene().endGame()
