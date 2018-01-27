extends "res://scripts/vendor/bag_aware.gd"

var ship_templates = {
    'avalon' : preload("res://scripts/entities/ships/avalon.gd"),
    'icarus' : preload("res://scripts/entities/ships/icarus.gd"),
    'basilisk' : preload("res://scripts/entities/ships/basilisk.gd"),
    'bigboy' : preload("res://scripts/entities/ships/bigboy.gd"),
    'leviathan' : preload("res://scripts/entities/ships/leviathan.gd"),
    'scorpion' : preload("res://scripts/entities/ships/scorpion.gd"),
    'sulaco' : preload("res://scripts/entities/ships/sulaco.gd"),
    'ship2' : preload("res://scripts/entities/ships/ship2.gd"),
    'ship3' : preload("res://scripts/entities/ships/ship3.gd"),
    'ship4' : preload("res://scripts/entities/ships/ship4.gd"),
}

func get(type):
    var ship = self.bag.cache.request(type)

    if ship == null:
        ship = self._build_new_ship(type)
    else:
        ship.reset()

    return ship

func _build_new_ship(type):
    var ship = null

    if not self.ship_templates.has(type):
        return null

    ship = self.ship_templates[type].new(self.bag.board, self.bag.processing, self.bag.timers, self.bag.cache)
    ship.shots_factory = self.bag.shots_factory

    return ship

func preload():
    var ship
    for type in self.ship_templates:
        ship = self.get(type)
        ship.attach()
        ship.detach()
