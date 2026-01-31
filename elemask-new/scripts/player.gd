extends CharacterBody2D

@onready var rect = $ColorRect   # path to your ColorRect child
@export var speed = 300.0

func get_input():
	if(Input.is_action_just_pressed("change_blue")):
		rect.color = Color.BLUE
		
	if(Input.is_action_just_pressed("change_red")):
		rect.color = Color.RED
	
	if(Input.is_action_just_pressed("change_green")):
		rect.color = Color.GREEN
		
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	
