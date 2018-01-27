extends "res://scripts/vendor/entities/moving_entity.gd"

func _init(board, processing).(board, processing):
    self.avatar = preload("res://scenes/player.tscn").instance()

    self.velocity = 1
