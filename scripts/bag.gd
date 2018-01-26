extends "res://scripts/vendor/bag.gd"

var test = preload("res://scenes/test.tscn").instance()

var players = preload("res://scripts/services/players.gd").new()

func _pre_initialize():
    self.input = preload("res://scripts/input/input.gd").new()

func _initialize():
    self.players._init_bag(self)
