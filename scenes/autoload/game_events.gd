extends Node

signal exp_vial_collected(number: float)

func emit_exp_vial_collected(number: float) -> void:
    exp_vial_collected.emit(number)
