extends "res://scripts/vendor/entities/board.gd"

var scene = preload("res://scenes/board.tscn").instance()

func _init():
    self.mount = self.scene
