extends Node

class_name player_two_input_component

var playertwo


func _ready():
	playertwo = get_parent()
	playertwo.connect("update", self, "handle_input")
func handle_input():
	if not "direction" in playertwo:
		return
		
	playertwo.direction = Vector2()
	
	if Input.is_action_pressed("up"):
		playertwo.direction.y -= 1
	if Input.is_action_pressed("down"):
		playertwo.direction.y += 1
