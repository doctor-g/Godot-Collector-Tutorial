extends KinematicBody2D

export var speed := 200

var active := true

# This function is called at regular intervals (e.g. 60 times per second)
# to update the state of this object.
#
# For the player, it is responsible for checking whether the input keys
# are being pressed and, if so, moving the character in the appropriate
# direction.
func _physics_process(delta):
	# If the player is no longer active, we leave this function.
	if not active:
		$AnimatedSprite.play("idle")
		return
	
	# The Input class is used to determine which keyboard inputs the player
	# is pressing. We store which direction the player is pressing in the
	# "direction" variable.
	var direction := Vector2(0,0)
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
		
	# "Normalizing" a vector means to make its length equal to 1.
	# This is necessary in order to make sure that the character does
	# not move faster diagonally than he does horizontally or vertically.
	direction = direction.normalized()
	
	# If the direction's length is non-zero, it means we're moving and
	# should play the "walk" animation.
	# If the direction's length is zero, that means we're standing still
	# and should play the "idle" animation.
	if direction.length() > 0:
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("idle")

	# If the player is going to the left, flip the image by changing
	# its scale in the x axis. 
	# Think of the scale as a number you are going to multiply:
	# if you multiply a number by 1, you get that number, but if you multiply
	# by -1, you negate the number. On a number line, a negative number
	# is like a mirror of the positive number.
	# Similarly, multiplying an image by a scale of 1 means to use the
	# original image, and multiplying it by a scale of -1 means to mirror it
	# horizontally.
	if direction.x < 0:
		$AnimatedSprite.scale.x = -1
	elif direction.x > 0:
		$AnimatedSprite.scale.x = 1

	# We are calling a function that is provided by Godot Engine here.
	# This function is part of the class "KinematicBody2D". Did you notice
	# at the top of this file that we said this Player "extends KinematicBody2D"?
	# That is what lets us call this function here.
	# You can ctrl-click on the function name to read the documentation for it
	# if you want to learn more about it. This works anywhere in the Godot 
	# script editor!
	move_and_collide(direction * speed * delta)
