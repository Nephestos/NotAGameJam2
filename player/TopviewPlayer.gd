extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func _ready():
	set_position(PlayerStats.return_map_position)

func get_input():
	var map_size = calculate_bounds().size
	var pos = get_position()
	velocity = Vector2()
	
	if Input.is_action_pressed("right"):
		if pos.x < map_size.x-16 :
			velocity.x += 1
			PlayerStats.direction = "right"
	if Input.is_action_pressed("left"):
		if pos.x > 16 :
			velocity.x -= 1
			PlayerStats.direction = "left"
	if Input.is_action_pressed("down"):
		if pos.y < map_size.y-16:
			velocity.y += 1
			PlayerStats.direction = "down"
	if Input.is_action_pressed("up"):
		if pos.y > 16 :
			velocity.y -= 1
			PlayerStats.direction = "up"
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func calculate_bounds():
	var tilemap = get_node("../GroundTileMap") as TileMap
	if tilemap:
		var cell_bounds = tilemap.get_used_rect()
		# create transform
		var cell_to_pixel = Transform2D(Vector2(tilemap.cell_size.x * tilemap.scale.x, 0), Vector2(0, tilemap.cell_size.y * tilemap.scale.y), Vector2())
		# apply transform
		return Rect2(cell_to_pixel * cell_bounds.position, cell_to_pixel * cell_bounds.size)
