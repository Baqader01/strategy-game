extends Camera2D

@export var velocity = 15
@export var zoom_speed = 0.05

#mouse states
var mouse_wheel_scrolling_up:bool = false
var mouse_wheel_scrolling_down:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#map controls
	if Input.is_action_pressed("Map_right"):
		position += Vector2(velocity, 0)
		
	if Input.is_action_pressed("Map_left"):
		position -= Vector2(velocity, 0)
	
	if Input.is_action_pressed("map_up"):
		position -= Vector2(0, velocity)
	
	if Input.is_action_pressed("map_down"):
		position += Vector2(0, velocity)
	
	#zoom controls
	if Input.is_action_pressed("map_zoom_in") || mouse_wheel_scrolling_up:
		if zoom < Vector2(3, 3):
			zoom += Vector2(zoom_speed, zoom_speed)
		
		#zoom controls
	if Input.is_action_pressed("map_zoom_out") || mouse_wheel_scrolling_down:
		if zoom > Vector2(0.1, 0.1):
			zoom -= Vector2(zoom_speed, zoom_speed)
	
	if Input.is_action_just_pressed("mouse_zoom_in"):
		mouse_wheel_scrolling_up = true
	else:
		mouse_wheel_scrolling_up = false
	
	if Input.is_action_just_pressed("mouse_zoom_out"):
		mouse_wheel_scrolling_down = true
	else:
		mouse_wheel_scrolling_down = false
	
