extends KinematicBody2D

#External Vars
export(int) var playerClass = 1 #1 to 4 being one of the four characters

#Const
const UP = Vector2(0,-1)
const GRAVITY = 15
const WALK_SPEED = 320 # Pixels/second
const JUMP_HEIGHT = -480

#var bulletCaster =

var motion = Vector2()

#Sprites
#Lator it will be dealt with

#Reference
#var ctrlUp = "p2_up"
#var ctrlDown = "p2_down"
#var ctrlLeft = "p2_left"
#var ctrlRight = "p2_right"
#var ctrlA = "p2_a"
#var ctrlB = "p2_b"
#var ctrlC = "p2_c"
#var ctrlD = "p2_d"


func _ready():
	#Player controls according to playerId
	pass

func _process(delta):
	#Todo:
		#Sprite Changes
		#Direction Changes on Visual
		#Projectiles and spawns
		#Status Changes/stats changes
	if Input.is_action_pressed("p2_left"):
		$facing.cast_to = Vector2(-20, 0)
		$direction.cast_to.x = -16
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("p2_right"):
		$facing.cast_to = Vector2(20, 0)
		$direction.cast_to.x = 16
		$AnimatedSprite.flip_h = false
	else:
		$direction.cast_to.x = 0
	if Input.is_action_pressed("p2_up"):
		$direction.cast_to.y = -16
	elif Input.is_action_pressed("p2_down"):
		$direction.cast_to.y = 16
	else:
		$direction.cast_to.y = 0
	if motion.y < -2:
		$AnimatedSprite.animation = "jumpUp"
	elif motion.y > 5:
		$AnimatedSprite.animation = "jumpDown"
	else:
		$AnimatedSprite.animation = "default"

func _physics_process(delta):
	#Gravity
	#motion.y += GRAVITY
	
	#Directions
	if Input.is_action_pressed("p2_left") && !Input.is_action_pressed("p2_c"):
		motion.x = -WALK_SPEED
	elif Input.is_action_pressed("p2_right") && !Input.is_action_pressed("p2_c"):
		motion.x = WALK_SPEED
	else:
		motion.x = 0
	
	#Jump and Gravity
	if is_on_floor():
		if Input.is_action_pressed("p2_d"):
			motion.y = JUMP_HEIGHT
			
	else:
		motion.y += GRAVITY
	
	#Apply Movement
	motion = move_and_slide(motion, UP)
