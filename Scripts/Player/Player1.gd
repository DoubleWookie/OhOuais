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
#var ctrlUp = "p1_up"
#var ctrlDown = "p1_down"
#var ctrlLeft = "p1_left"
#var ctrlRight = "p1_right"
#var ctrlA = "p1_a"
#var ctrlB = "p1_b"
#var ctrlC = "p1_c"
#var ctrlD = "p1_d"


func _ready():
	#Player controls according to playerId
	pass

func _process(delta):
	#Todo:
		#Sprite Changes
		#Direction Changes on Visual
		#Projectiles and spawns
		#Status Changes/stats changes
	if Input.is_action_pressed("p1_left"):
		$facing.cast_to = Vector2(-20, 0)
		$direction.cast_to.x = -16
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("p1_right"):
		$facing.cast_to = Vector2(20, 0)
		$direction.cast_to.x = 16
		$AnimatedSprite.flip_h = false
	else:
		$direction.cast_to.x = 0
	if Input.is_action_pressed("p1_up"):
		$direction.cast_to.y = -16
	elif Input.is_action_pressed("p1_down"):
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
	if Input.is_action_pressed("p1_left") && !Input.is_action_pressed("p1_c"):
		motion.x = -WALK_SPEED
	elif Input.is_action_pressed("p1_right") && !Input.is_action_pressed("p1_c"):
		motion.x = WALK_SPEED
	else:
		motion.x = 0
	
	#Jump and Gravity
	if is_on_floor():
		if Input.is_action_pressed("p1_d"):
			motion.y = JUMP_HEIGHT
			
	else:
		motion.y += GRAVITY
	
	#Apply Movement
	motion = move_and_slide(motion, UP)
