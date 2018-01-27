extends "res://scripts/vendor/bag_aware.gd"

const PLAYER_COUNT = 2

var player_template = preload("res://scripts/entities/player.gd")

var players = []

var default_ship_type = ['avalon', 'scorpion']

func _initialize():
    self._build_players()
    self._bind_players()

func _bind_players():
    for player in self.players:
        self._bind_player(player)

func _bind_player(player):
    player.bind_controls(self.bag.input)

func _build_player(index):
    var player = self.player_template.new(index)
    player.director = self.bag.director
    player.players = self

    player.use_ship(self._get_ship(self.default_ship_type[index]))

    return player

func _get_ship(ship_name):
    return self.bag.ships_factory.get(ship_name)

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

func swap_ship_for_player(player, ship_name):
    var new_ship = self._get_ship(ship_name)
    var old_ship = player.ship
    var position = old_ship.get_pos()

    if new_ship == null:
        return

    player.use_ship(new_ship)
    old_ship.despawn()
    new_ship.spawn(position)

