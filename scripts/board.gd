extends "res://scripts/vendor/entities/board.gd"

var scene = preload("res://scenes/board.tscn").instance()

var board_mount
var input
var menu

func _initialize(board_mount, input, menu):
    self.board_mount = board_mount
    self.input = input
    self.menu = menu

    self.mount = self.scene

func start_game():
    self.board_mount.add_child(self.scene)
    self.input.switch_to_scheme("game")
    self.menu.hide()
