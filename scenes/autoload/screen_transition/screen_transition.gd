extends CanvasLayer

signal transitioned_halfway

func transition():
	$AnimationPlayer.play("default")
	await $AnimationPlayer.animation_finished
	transitioned_halfway.emit()
	$AnimationPlayer.play_backwards()
	await $AnimationPlayer.animation_finished
