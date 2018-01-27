extends "res://scripts/vendor/entities/moving_entity.gd"

func _init(board, processing).(board, processing):
    self.avatar = preload("res://scenes/player.tscn").instance()

    self.velocity = 2
    self.position_constraint_positive = Vector3(5, 11, 0)
    self.position_constraint_negative = Vector3(-5, 0.5, 0)
    self.constrain_position = true
