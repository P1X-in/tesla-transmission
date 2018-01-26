extends "res://scripts/vendor/bag_aware.gd"

var player_template = preload("res://scripts/entities/player.gd")

var player1
var player2

func _initialize():
    self.player1 = self.player_template.new()
    self.player2 = self.player_template.new()

    self.bind_players()

func bind_players():
    self.player1.bind_controls(self.bag.input)