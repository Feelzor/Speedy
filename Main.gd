extends Node2D

var enemy = preload("res://Enemy.tscn")
var speedUp = preload("res://SpeedUp.tscn")

var colors = [
	Color(214/255.0, 214/255.0, 214/255.0),
	Color(134/255.0, 103/255.0, 103/255.0),
	Color(120/255.0, 159/255.0, 156/255.0),
	Color(113/255.0, 104/255.0, 133/255.0)
];

func _ready():
	get_tree().paused = false
	randomize()
	$SpawnTimer.wait_time = 1.2
	setSpeedUpTimer()
	spawn()
	
func setSpeedUpTimer():
	$SpeedUpTimer.wait_time = randf() * 12
	
func spawn():
	var node = enemy.instance()
	node.position.x = randi() % 1120 + 80
	add_child(node)

func _on_SpawnTimer_timeout():
	spawn()
	
func endGame():
	$GameOver.visible = true
	get_tree().paused = true
	$RestartGame.start()

func _on_RestartGame_timeout():
	get_tree().reload_current_scene()

func increaseDifficulty():
	$SpawnTimer.wait_time -= randf() * 0.05
	if ($SpawnTimer.wait_time < 0.3):
		$SpawnTimer.wait_time = 0.3 
	
	global.enemyBaseSpeed += randf()
	if (global.enemyBaseSpeed > 650):
		global.enemyBaseSpeed = 650

func _on_left_button_down():
	$Player.changeMovement(-1, 0)


func _on_left_button_up():
	$Player.changeMovement(1, 0)


func _on_right_button_down():
	$Player.changeMovement(1, 0)


func _on_right_button_up():
	$Player.changeMovement(-1, 0)


func _on_SpeedUpTimer_timeout():
	var node = speedUp.instance()
	node.position.x = randi() % 1120 + 80
	add_child(node)
	setSpeedUpTimer()
	
func removeSpeed():
	$SpeedUpTimer.stop()


func _on_ColorChange_timeout():
	$ColorRect.color = colors[randi() % colors.size()]
