extends CharacterBody2D

#globalvar
var box_size: Vector2 = Vector2(1152,648) #box area
var start_pos: Vector2 = Vector2(250,250) #center of box area
var direction: Vector2 = Vector2.RIGHT #it's initial movement direction (to be updated)
var currhorde: int = 0
const speed = 200.0
@export var enemy_element: MASK = MASK.MASKFIRE

#player mask code
enum MASK { MASKFIRE, #0
			MASKWATER, #1
			MASKGRASS, #2
			MASKEARTH, #3
}
var CURMASK = MASK.MASKFIRE

#if curmask is water it can kill fire

#if curmask is fire it can kill wind

#if curmask is wind it can kill earth

#if curmask is earth it can kill water

'''based on whether the right mask has been presented the enemy dies'''
#func mask_mechanics():
	#absorb()
	#queue_free()
	#
#func absorb():
	#currhorde = currhorde + 1
	##spawn a player object that statically follows the horde. 
	## add to horde
	#

func _on_hit_by_player(CURMASK):
	var can_die = false
	match enemy_element:
		MASK.MASKFIRE:
			if CURMASK == MASK.MASKWATER: can_die = true
		MASK.MASKWATER:
			if CURMASK == MASK.MASKEARTH: can_die = true
		MASK.MASKEARTH:
			if CURMASK == MASK.MASKEARTH: can_die = true
		MASK.MASKGRASS:
			if CURMASK == MASK.MASKFIRE: can_die = true
			


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


		

		
