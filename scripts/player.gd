extends CharacterBody2D

var speed = 300
var previous_animation = "idle"

func _ready() -> void:
	$LeftLeg.rotation = 0
	$RightLeg.rotation = 0
	$LeftLeg.scale.y = 1
	$RightLeg.scale.y = 1

func _physics_process(_delta: float) -> void:
	var input_vector_x = Input.get_axis("q", "d")
	var input_vector_y = Input.get_axis("z", "s")
	var input_vector = Vector2(input_vector_x, input_vector_y).normalized()
	
	var animation = "idle"
	
	if animation != previous_animation:
		$LeftLeg.rotation = 0
		$RightLeg.rotation = 0
		$LeftLeg.scale.y = 1
		$RightLeg.scale.y = 1
		$LeftArm.rotation = 0
		$RightArm.rotation = 0
		$LeftArm.z_index = 0
		$RightArm.z_index = 0
		$LeftArm.scale.y = 1
		$RightArm.scale.y = 1
	
	if input_vector != Vector2(0,0):
		if input_vector_x != 0:
			if input_vector_x < 0:
				animation = "walk_left"
			else:
				animation = "walk_right"
		else:
			animation = "walk_up"
	else:
		if $AnimationPlayer.is_playing() and "walk" in $AnimationPlayer.current_animation:
			animation = "idle"
	
	previous_animation = animation
	$AnimationPlayer.play(animation)
	
	velocity = input_vector * speed
	move_and_slide()
