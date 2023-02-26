extends Node2D

export(String, FILE) var next_scene_path = ""

func get_configuartion_warning() -> String:
	if next_scene_path == "":
		return "next_scene_path must be set for the portail to work"
	else:
		return ""


func _on_Portail_body_entered(body):
	
	# Pour revenir à la bonne position
	if not PlayerStats.return_to_map:
		
		var direction = PlayerStats.direction
		if direction == "up":
			PlayerStats.return_map_position = get_position() + Vector2(0, 32)
		elif direction == "down":
			PlayerStats.return_map_position = get_position() + Vector2(0, -32)
		elif direction == "left":
			PlayerStats.return_map_position = get_position() + Vector2(32, 0)
		elif direction == "right":
			PlayerStats.return_map_position = get_position() + Vector2(-32, 0)
		else:
			print("Erreur : direction non valide")
	PlayerStats.return_to_map = not PlayerStats.return_to_map
	
	if get_tree().change_scene(next_scene_path) != OK:
		#Error Handling
		print("Erreur : Scene indisponible.")
