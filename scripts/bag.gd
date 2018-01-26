extends "res://scripts/vendor/bag.gd"

var test = preload("res://scenes/test.tscn").instance()

func _pre_initialize():
    self.input = preload("res://scripts/input/input.gd").new()

func _initialize():
    return

