extends "res://scripts/entities/ship.gd"

func _init(board, processing, timers, cache).(board, processing, timers, cache):
    self.avatar = preload("res://scenes/ship3.tscn").instance()

    self.velocity = 24

    self.type_name = 'icarus'

    self.shot_spawn_offset = [
        Vector3(-1, 0, -3.5),
        Vector3(1, 0, -3.5),
    ]
