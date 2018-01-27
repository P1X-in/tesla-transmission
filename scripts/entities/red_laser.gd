extends "res://scripts/entities/shot.gd"

func _init(board, processing, cache).(board, processing, cache):
    self.avatar = preload("res://scenes/laser_red.tscn").instance()

    self.velocity = 50
    self.type_name = 'laser_red'
