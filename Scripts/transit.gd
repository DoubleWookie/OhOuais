extends Node

#initial new game values
var noOfPlayer = 2
var typePl = Vector2()
var mapSelected = 0
var difficulty = 0
var lives = 0
var scrPl1 = 0
var scrPl2 = 0
var scrTotal = 0

func _initialise():
	#setup Players at the beggining of new game
	for i in noOfPlayer:
		lives += 2
	print(lives)

func _minus_life():
	lives -= 1
	#Eventually check if out of lives to bring back to score screen
	#and restart

func _scr_add(player, points):
	if player == 1:
		scrPl1 += points
		scrTotal += points
	elif player == 2:
		scrPl2 += points
		scrTotal += points



#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
