extends Area2D

@export var speed = 400
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2(0,0) #Set movement speed initialy to zero
	
	if(Input.is_action_pressed("move_right")):
		velocity.x += 1
	if(Input.is_action_pressed("move_left")):
		velocity.x -= 1
	if(Input.is_action_pressed("move_up")):
		velocity.y -= 1
	if(Input.is_action_pressed("move_down")):
		velocity.y += 1
		
	#Character will move faster diagonally, so we normalize it
	if(velocity.length() > 0):
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play() #Play moving sprite animation
	else:
		$AnimatedSprite2D.stop() #Stop moving sprite animation
		
	
	position += velocity * delta
	position = position.clamp(Vector2(0,0), screen_size)
