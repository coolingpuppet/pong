extends Node2D

var score_player_one = 0
var score_player_two = 0
var max_score = 3

func _ready():
	$StartTimer.start()


func _on_Field_goal_left():
	score_player_two += 1
	print(score_player_two)
	if score_player_two < max_score:
		start_new_round()


func _on_Field_goal_right():
	score_player_one += 1
	print(score_player_one)
	if score_player_one < max_score:
		start_new_round()

func start_new_round():
	$Ball.reset()
	$Player.set_position(Vector2(64, 360))
	$AI.set_position(Vector2(1216, 360))
	$StartTimer.start()


func _on_StartTimer_timeout():
	$Ball.set_start_direction()
