extends CharacterBody2D

#globalvar
var box_size: Vector2 = Vector2(1152,648) #box area
var start_pos: Vector2 = Vector2(250,250) #center of box area
var direction: Vector2 = Vector2.RIGHT #it's initial movement direction (to be updated)

const speed = 200.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

func ready():
	position = start_pos
	direction = Vector2.RIGHT.rotated(randf_range(0,TAU))    
	
func _dvd_physics(delta):
	velocity = direction * speed
	move_and_slide()
	
	#if check
	if position.x <start_pos.x - box_size.x / 2:
		direction = abs(direction.x) #bounce toward right
	elif position.x > start_pos.x + box_size.x / 2:
		direction.x = -abs(direction.x)#bounce left
	
	if position.x < start_pos.x - box_size.x / 2:
		direction.y = abs(direction.y) #bounce downards
	elif position.y >start_pos.y + box_size.y / 2:
		direction.y -abs(direction.y) #bounce upwards
		
		
