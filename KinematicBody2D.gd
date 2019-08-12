extends KinematicBody2D

var motion = Vector2()

func _physics_process(delta):
	
	
	# Move the character Left or Right		
	if Input.is_action_pressed("ui_right"):
		motion.x = 100
	elif Input.is_action_pressed("ui_left"):
		motion.x = -100	
	else:
		motion.x = 0
	
		
	# Move the character Up or Down		
	if Input.is_action_pressed("ui_up"):
		motion.y = -100	
	elif Input.is_action_pressed("ui_down"):
		motion.y = 100		
	else:
		motion.y = 0
		
	motion.y += 20

	move_and_slide(motion)	
	
	pass
