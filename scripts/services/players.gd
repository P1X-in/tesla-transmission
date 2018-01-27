extends "res://scripts/vendor/bag_aware.gd"

const PLAYER_COUNT = 1

var player_template = preload("res://scripts/entities/player.gd")

var players = []

func _initialize():
    self._build_players()
    self._bind_players()

func _bind_players():
    for player in self.players:
        self._bind_player(player)

func _bind_player(player):
    player.bind_controls(self.bag.input)
    player.ship.bind(self.bag.test)

func _build_player(index):
    return self.player_template.new()

func _build_players():
    var i

    for i in range(self.PLAYER_COUNT):
        self.players.append(self._build_player(i))
