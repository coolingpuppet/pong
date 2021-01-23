extends Node2D

onready var hud = get_node("HUD")

var score_player_one = 0
var score_player_two = 0
var max_score = 3

func _ready():
	update_score()
	$StartTimer.start()

func _process(delta):
	if $StartTimer.time_left > 1:
		hud.get_node("TimerDisplay/CenterContainer/Label").set_text(str(round($StartTimer.time_left)))

func _on_Field_goal_left():
	score_player_two += 1
	update_score()
	if score_player_two < max_score:
		start_new_round()
	else:
		show_winner("You Lost")


func _on_Field_goal_right():
	score_player_one += 1
	update_score()
	if score_player_one < max_score:
		start_new_round()
	else:
		show_winner("You Win")

func start_new_round():
	$Ball.reset()
	$Player.set_position(Vector2(64, 360))
	$AI.set_position(Vector2(1216, 360))
	hud.get_node("TimerDisplay").set_visible(true)
	$StartTimer.start()

func start_new_game():
	score_player_one = 0
	score_player_two = 0
	update_score()
	$FinalScreen.set_visible(false)
	start_new_round()

func _on_StartTimer_timeout():
	hud.get_node("TimerDisplay").set_visible(false)
	$Ball.set_start_direction()

func update_score():
	hud.get_node("ScoreDisplay/Player_Score").set_text(str(score_player_one))
	hud.get_node("ScoreDisplay/Opponent_Score").set_text(str(score_player_two))

func show_winner(message):
	$FinalScreen.set_visible(true)
	$FinalScreen.get_node("VBoxContainer/ResultMassage").set_text(message)


func _on_FinalScreen_new_round():
	start_new_game()


func _on_FinalScreen_exit():
	get_tree().quit()
