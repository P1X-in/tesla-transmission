extends "res://scripts/vendor/bag.gd"

var board = preload("res://scripts/board.gd").new()
var players = preload("res://scripts/services/players.gd").new()
var intro = preload("res://scripts/services/intro.gd").new()
var enemies = preload("res://scripts/services/enemies.gd").new()
var director = preload("res://scripts/services/director.gd").new()

func _pre_initialize():
    self.input = preload("res://scripts/input/input.gd").new()

func _initialize():
    self.board._initialize(self.root, self.input, self.intro)
    self.players._init_bag(self)
    self.intro._init_bag(self)
    self.enemies._init_bag(self)
    self.director._initialize(self.timers, [])
