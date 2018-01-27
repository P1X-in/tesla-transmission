extends "res://scripts/vendor/bag.gd"

var board = preload("res://scripts/board.gd").new()
var players = preload("res://scripts/services/players.gd").new()
var menu = preload("res://scripts/services/menu.gd").new()

func _pre_initialize():
    self.input = preload("res://scripts/input/input.gd").new()

func _initialize():
    self.board._initialize(self.root, self.input, self.menu)
    self.players._init_bag(self)
    self.menu._init_bag(self)
