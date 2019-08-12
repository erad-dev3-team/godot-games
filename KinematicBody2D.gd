extends KinematicBody2D

var motion = Vector2()
const UP = Vector2(0,-1)
const MAX_SPEED = 200
const GRAVITY = 20
const ACCELERATION = 25
const JUMP_HEIGHT = -550

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	# Move the character Left or Right		
	if Input.is_action_pressed("ui_right"):
		$Sprite.flip_h = false
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		#get_node("Sprite")flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		$Sprite.flip_h = true
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$Sprite.play("Run")
	else:
		$Sprite.play("Idle")
		friction = true
		
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)			
	else:
		if motion.y > 0:
			$Sprite.play("Fall")
		else:			
			$Sprite.play("Jump")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
		
	move_and_slide(motion, UP)	
	pass
