extends "res://scripts/vendor/bag_aware.gd"

const PLAYER_COUNT = 1

var player_template = preload("res://scripts/entities/player.gd")
var ship_template = preload("res://scripts/entities/ship.gd")

var players = []

var default_ship_type = 'ship'

func _initialize():
    self._build_players()
    self._bind_players()

func _bind_players():
    for player in self.players:
        self._bind_player(player)

func _bind_player(player):
    player.bind_controls(self.bag.input)

func _build_player(index):
    var player = self.player_template.new()

    player.use_ship(self._get_ship(self.default_ship_type))

    return player

func _get_ship(ship_name):
    var ship = self.bag.cache.request(ship_name)

    if ship == null:
        ship = self.ship_template.new(self.bag.board, self.bag.processing, self.bag.timers, self.bag.cache)

    return ship

func _build_players():
    var i

    for i in range(self.PLAYER_COUNT):
        self.players.append(self._build_player(i))

func get_positions():
    var positions = []
    var position

    for player in players:
        position = player.get_position_for_enemy()
        if position != null:
            positions.append(position)

    return positions
