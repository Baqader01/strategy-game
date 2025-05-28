extends Camera2D

@export var velocity = 15
@export var zoom_speed = 0.05

#mouse states
var mouse_wheel_scrolling_up:bool = false
var mouse_wheel_scrolling_down:bool = false

#map boundaries
var left_bound:float
var right_bound:float
var top_bound:float
var bottom_bound:float

#map reference
@onready var map = $"../HexTileMap"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	left_bound = to_global(map.map_to_local(Vector2i(0,0))).x + 100
	right_bound = to_global(map.map_to_local(Vector2i(map.width, 0))).x - 100
	top_bound = to_global(map.map_to_local(Vector2i(0,0))).y + 50
	bottom_bound = to_global(map.map_to_local(Vector2i(0,map.height))).y - 50
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	#map controls
	if Input.is_action_pressed("Map_right") and position.x < right_bound:
		position += Vector2(velocity, 0)
		
	if Input.is_action_pressed("Map_left") and position.x > left_bound:
		position += Vector2(-velocity, 0)
	
	if Input.is_action_pressed("map_up") and position.y > top_bound:
		position += Vector2(0, -velocity)
	
	if Input.is_action_pressed("map_down") and position.y < bottom_bound:
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
	
