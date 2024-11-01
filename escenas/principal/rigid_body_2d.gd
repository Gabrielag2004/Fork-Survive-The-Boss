extends RigidBody2D

var picked  = false

func _physics_process(delta):
	if picked == true:
		self.position = get_node("../Player/CharacterBody2D/Marker2D").global_position
	
func _input(event):
	if Input.is_action_just_pressed("ui_pick"):
		var bodies = $"../Area2D".get_overlapping_bodies()
		for body in bodies:
			if body.name == "Player" and get_node("../Player").canPick == true:
				picked = true
				get_node("../Player").canPick == false
					
	
