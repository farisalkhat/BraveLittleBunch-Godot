extends "res://characters/player/PlayerProcesses.gd"

var state 

func _ready():
	state = "default"

func _process(delta):
	match state:
		"default":
			input_loop()
			movement_loop()
			spritedir_loop()
			animation_loop()
