extends "res://scripts/entities/ship.gd"

func _init(board, processing, timers, cache).(board, processing, timers, cache):
    self.avatar = preload("res://scenes/ship5.tscn").instance()

    self.velocity = 24

    self.type_name = 'sulaco'

    self.shot_spawn_offset = [
        Vector3(-3, 0, -3.5),
        Vector3(3, 0, -3.5),
        Vector3(0, 0.5, -5.5),
    ]
