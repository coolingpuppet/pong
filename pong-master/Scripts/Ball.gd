extends KinematicBody2D

export var initital_ball_speed = 450
export var speed_commulator = 50
var ball_speed = initital_ball_speed

var hit_counter = 0
var max_hitcounter = 12
var direction = Vector2()

func _ready():
	randomize()
	#set_start_direction()

func set_start_direction():
	var random_x = 0
	
	if randi()%10 < 5:
		random_x = 1
	else:
		random_x = -1
		
	direction = Vector2(random_x, rand_range(-1,1))
	direction = direction.normalized() * ball_speed
	
func _physics_process(delta):
	var collision = move_and_collide(direction * delta)
	if collision:
		direction = direction.bounce(collision.normal)
		if collision.collider.is_in_group("rackets"):
			var y = direction.y / 2 + collision.collider_velocity.y
			
			direction = Vector2(direction.x, y).normalized() * (ball_speed + hit_counter * speed_commulator)
			
			if hit_counter < max_hitcounter:
				hit_counter += 1
				
			$RacketHit.play()
		else:
			$WallHit.play()
			
func reset():
	position = Vector2(640,360)
	direction = Vector2()
	hit_counter = 0
