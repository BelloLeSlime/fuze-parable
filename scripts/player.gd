extends CharacterBody2D

var speed = 300

func _physics_process(_delta: float) -> void:
	var input_vector_x = Input.get_axis("q", "d")
	var input_vector_y = Input.get_axis("z", "s")
	var input_vetcor = Vector2(input_vector_x, input_vector_y).normalized()
	
	velocity = input_vetcor * speed
	move_and_slide()
