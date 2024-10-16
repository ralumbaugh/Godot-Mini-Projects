extends Area3D
@onready var model = $Model

@export var score_to_give : int = 1
@export var my_materials : Array[Material]
var clicks_to_pop : int

func _ready():
	model.set_surface_override_material(0, my_materials.pick_random())
	clicks_to_pop = int(randf_range(2, 9))

func _on_input_event(_camera, event, _event_position, _normal, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		scale += Vector3.ONE * randf_range(0.15, 0.5)
		clicks_to_pop -= 1
		if clicks_to_pop == 0:
			get_node("/root/Main").increase_score(score_to_give)
			queue_free()
