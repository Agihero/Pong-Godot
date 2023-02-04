extends Area2D


#Move Speed
export var speed = 400

#Window Screen-size
var screen_size

#Player Movement Functions
func manip_velocity(velocity):
	if (Input.is_action_pressed("move_left")):
		velocity.x -= 1
	
	if (Input.is_action_pressed("move_right")):
		velocity.x += 1

	return velocity

	
func player_movement(delta):
	#Player Vector (Init to Zero, manipulated by Player input)
	var velocity = Vector2.ZERO
	velocity = manip_velocity(velocity)

	#If the manipulated Velocity is > 0, then normalize the vector and apply speed
	if (velocity.length() > 0):
		velocity = velocity.normalized() * speed;

	#Modify the Position
	position += velocity * delta

	#Clamp position to screen
	position.x = clamp(position.x, 0, screen_size.x)


#Initialization
func _ready():
	#initialize the size of the screen
	screen_size = get_viewport_rect().size


#Per frame
func _process(delta):
	#Move the player when keys are pressed (and clamps them to the screen)
	player_movement(delta)
