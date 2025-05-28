extends Node2D

@export var width = 100
@export var height = 60

@onready var base_layer = $BaseLayer
@onready var border_layer = $HexBoxLayer
@onready var overlay_layer = $SelectionOverlayLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_terrain()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func generate_terrain():
	for x in range(width):
		for y in range(height):
			base_layer.set_cell(Vector2i(x,y), 0, Vector2i(0,0))
			border_layer.set_cell(Vector2i(x,y), 0, Vector2i(0,0))

func map_to_local(coords:Vector2i):
	return base_layer.map_to_local(coords)
