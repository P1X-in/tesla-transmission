extends "res://scripts/entities/ship.gd"

func _init(board, processing, timers, cache).(board, processing, timers, cache):
    self.avatar = preload("res://scenes/ship11.tscn").instance()

    self.velocity = 24

    self.type_name = 'goliath'