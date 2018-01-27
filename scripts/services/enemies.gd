extends "res://scripts/vendor/bag_aware.gd"

var enemy_template = preload("res://scripts/entities/enemy.gd")
var ship_template = preload("res://scripts/entities/ship.gd")

var enemies = {}

func build_enemy():
    var enemy = self.enemy_template.new()
    enemy.use_ship(self.ship_template.new(self.bag.board, self.bag.processing, self.bag.timers))

    return enemy

func register_enemy(enemy):
    self.enemies[enemy.get_instance_id()] = enemy

func unregister_enemy(enemy):
    self.enemies.erase(enemy.get_instance_id())

func execute_pattern(pattern):
    return
