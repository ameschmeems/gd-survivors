extends Node

signal experience_updated(current_experience: float, target_experience: float)
signal level_up(level: int)

const TARGET_EXP_GROWTH = 5

var current_exp = 0
var current_level = 1
var target_exp = 5

func _ready():
	GameEvents.exp_vial_collected.connect(on_exp_vial_collected)

func increment_experience(number: float) -> void:
	current_exp = min(current_exp + number, target_exp)
	if current_exp == target_exp:
		current_level += 1
		target_exp += TARGET_EXP_GROWTH
		current_exp = 0
		level_up.emit(current_level)
	experience_updated.emit(current_exp, target_exp)
	# print(current_exp)

func on_exp_vial_collected(number: float) -> void:
	increment_experience(number)
