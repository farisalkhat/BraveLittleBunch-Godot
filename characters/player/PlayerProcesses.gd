extends KinematicBody2D

export var playername = "player"
export var speed = 200

var velocity = Vector2(0,0)
var movedir
var spritedir

func _ready():
	pass # Replace with function body.


func input_loop():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	
	movedir = velocity
	velocity = velocity.normalized() * speed
	
func movement_loop():
	velocity = move_and_slide(velocity)



func spritedir_loop():
	#Based on which direction the player is moving, change the 
	#sprite direction as well. 
	match movedir:
		Vector2(-1,0):
			spritedir="left"
		Vector2(1,0):  
			spritedir="right"





func animation_loop():
	#Depending on what the player is doing, trigger an animation. 
	if movedir!=Vector2(0,0):
		anim_switch("walk")
	else:
		anim_switch("idle")
func anim_switch(animation):
	#helper method to trigger an anitmation. 
	if spritedir == null:
		return
	var newanim = str(animation,spritedir)
	if $AnimationPlayer.current_animation != newanim:
		$AnimationPlayer.play(newanim)
