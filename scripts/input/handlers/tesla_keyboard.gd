extends "res://scripts/vendor/input/handlers/keyboard_handler.gd"

var player

func _init(player, scancode):
    self.player = player
    self.scancode = scancode

func handle(event):
    self.player.set_tesla_shooting(event.is_pressed())
