extends Node2D

#scenes loader
onready var scPl1 = preload("res://Scenes/Players/Player1.tscn")
onready var scPl2 = preload("res://Scenes/Players/Player2.tscn")
onready var Player1 = scPl1.instance()
onready var Player2 = scPl2.instance()

func _ready():
	print("Initializing")
	
	add_child(Player1)
	add_child(Player2)
	Player1.position = $spawn.position
	Player2.position = $spawn.position
	
func _process(delta):
	var plDist = sqrt(pow(Player1.position.x - Player2.position.x, 2)+pow(Player1.position.y - Player2.position.y, 2))
	$Camera2D.offset = Vector2((Player1.position.x + Player2.position.x) / 2, (Player1.position.y + Player2.position.y) / 2)
	#$Camera2D/RigidBody2D.position = $Camera2D.offset
	#Zoom out camera if players get away
	if plDist > 700:
		var zoomDist = ((plDist - 700) / 1000) + 1
		$Camera2D.zoom = Vector2(zoomDist, zoomDist)
