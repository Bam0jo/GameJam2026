extends CharacterBody2D

#globalvar
var box_size: Vector2 = Vector2(1152,648) #box area
var start_pos: Vector2 = Vector2(250,250) #center of box area
var direction: Vector2 = Vector2.RIGHT #it's initial movement direction (to be updated)
const currhorde: int = 0


#player mask code
enum MASK { maskfire,
			maskwater,
			maskgrass,
			maskearth,
}
const CURMASK: Array[int] = [MASK.maskfire, MASK.maskwater, MASK.grass, MASK.maskearth]
#if curmask is water it can kill fire

#if curmask is fire it can kill wind

#if curmask is earth it can kill water


const speed = 200.0

'''interacts with move_and_slide()'''
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

'''initial position'''
func ready():
	position = start_pos
	direction = Vector2.RIGHT.rotated(randf_range(0,TAU))    
	
'''dvd logo based physics till natural enemy movement has been implemented.'''
func _dvd_physics(_delta):
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
		@warning_ignore("standalone_expression") #added warning ignore to make it less annoying.
		direction.y -abs(direction.y) #bounce upwards

func despawn():
	
	pass
	
func absorb():
	currhorde + 1
	# add to horde
	#spawn a player object that statically follows the horde. 

	
		
'''based on whether the right mask has been presented the enemy dies'''
func mask_mechanics():
	if curmask == MASK.maskfire:
		despawn()

	if curmask == MASK.maskgrass:
		despawn()

	if curmask == MASK.maskearth:
		despawn()
	if curmask == MASK.maskwater:
		despawn()

		
		
