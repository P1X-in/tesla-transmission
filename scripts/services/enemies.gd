extends "res://scripts/vendor/bag_aware.gd"

var enemy_template = preload("res://scripts/entities/enemy.gd")
var ship_template = preload("res://scripts/entities/ship.gd")

var enemies = {}

func build_enemy(ship_type, path):
    var ship = self._get_ship(ship_type)
    var enemy = self.enemy_template.new(self.bag.processing, self.bag.players, self, ship, path)

    self.register_enemy(enemy)
    return enemy

func register_enemy(enemy):
    self.enemies[enemy.get_instance_id()] = enemy

func unregister_enemy(enemy):
    self.enemies.erase(enemy.get_instance_id())

func execute_pattern(pattern):
    pattern.begin()

func _get_ship(ship_name):
    var ship = self.bag.cache.request(ship_name)

    if ship == null:
        ship = self.ship_template.new(self.bag.board, self.bag.processing, self.bag.timers, self.bag.cache)

    ship.reset()
    ship.die_on_collision = true
    return ship
