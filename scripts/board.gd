extends "res://scripts/vendor/entities/board.gd"

var scene = preload("res://scenes/board.tscn").instance()

var board_mount
var input
var intro

func _initialize(board_mount, input, intro):
    self.board_mount = board_mount
    self.input = input
    self.intro = intro

    self.mount = self.scene

func start_game():
    self.board_mount.add_child(self.scene)
    self.input.switch_to_scheme("game")
    self.intro.hide()
