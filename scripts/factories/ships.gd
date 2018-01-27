extends "res://scripts/vendor/bag_aware.gd"

var ship_templates = {
    'avalon' : preload("res://scripts/entities/ships/avalon.gd")
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

    ship = self.ship_templates[type].new(self.bag.board, self.bag.processing, self.bag.timers, self.bag.cache)

    return ship

