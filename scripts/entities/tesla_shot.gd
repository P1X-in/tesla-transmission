extends "res://scripts/entities/shot.gd"

func _init(board, processing, cache).(board, processing, cache):
    self.avatar = preload("res://scenes/tesla_shot.tscn").instance()

    self.type_name = 'tesla_shot'
