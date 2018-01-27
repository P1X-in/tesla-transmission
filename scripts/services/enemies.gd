extends "res://scripts/vendor/bag_aware.gd"

var enemy_template = preload("res://scripts/entities/enemy.gd")
var ship_template = preload("res://scripts/entities/ship.gd")

var enemies = {}

func _build_enemy():
    var enemy = self.enemy_template.new()
    enemy.use_ship(self.ship_template.new(self.bag.board, self.bag.processing, self.bag.timers))

    return enemy
