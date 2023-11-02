extends Node

@export_range(0, 1) var drop_percent: float = .5
@export var vial_scene: PackedScene
@export var health_component: Node

func _ready():
	(health_component as HealthComponent).died.connect(on_died)

func on_died():
	var adjusted_drop_percent = drop_percent
	var exp_gain_upgrade_count = MetaProgression.get_upgrade_count("experience_gain")
	if exp_gain_upgrade_count > 0:
		adjusted_drop_percent += .1 * exp_gain_upgrade_count

	if randf() > adjusted_drop_percent:
		return

	if !vial_scene:
		return
	
	if !(owner is Node2D):
		return
	
	var spawn_position = (owner as Node2D).global_position
	var vial_instance = vial_scene.instantiate() as Node2D
	var entities_layer = get_tree().get_first_node_in_group("entities_layer")
	entities_layer.add_child(vial_instance)
	vial_instance.global_position = spawn_position
