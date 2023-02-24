tool

extends Node2D

export(String, FILE) var next_scene_path = ""

func get_configuartion_warning() -> String:
	if next_scene_path == "":
		return "next_scene_path must be set for the portail to work"
	else:
		return ""


func _on_Portail_body_entered(body):
	print("Gros tas de merde !!!")
	if get_tree().change_scene(next_scene_path) != OK:
		#Error Handling
		print("Erreur : Scene indisponible.")
