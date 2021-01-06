extends Node2D

var player_score = 0
var opponent_score = 0

func _ready():
	$UI/Clock.visible = false

func _on_LeftWall_body_entered(body):
	$Ball.position = Vector2(640,360)
	opponent_score += 1
	get_tree().call_group("BallGroup","stop_ball")
	$CountdownTimer.start()
	$UI/Clock.visible = true


func _on_RightWall2_body_entered(body):
	$Ball.position = Vector2(640,360)
	player_score += 1
	get_tree().call_group("BallGroup","stop_ball")
	$CountdownTimer.start()
	$UI/Clock.visible = true

func _process(delta):
	$UI/PlayerScore.text = str(player_score)
	$UI/OpponentScore.text = str(opponent_score)
	$UI/Clock.text = str(int($CountdownTimer.time_left))
	


func _on_CountdownTimer_timeout():
	get_tree().call_group("BallGroup","restart_ball")
	$UI/Clock.visible = false
