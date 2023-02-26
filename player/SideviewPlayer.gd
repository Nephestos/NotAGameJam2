extends KinematicBody2D

export(NodePath) var node_path
onready var sprite = get_node(node_path) as Sprite

func _ready():
	if sprite:	
		$Camera2D.limit_left = 0
		$Camera2D.limit_right = sprite.texture.get_width() * sprite.scale.x
		$Camera2D.limit_bottom = sprite.texture.get_height() * sprite.scale.y
		$Camera2D.limit_top = 0

export (int) var speed = 200

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	velocity = velocity.normalized() * speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func set_active(active):
	set_physics_process(active)
	set_process(active)
	set_process_input(active)
	
