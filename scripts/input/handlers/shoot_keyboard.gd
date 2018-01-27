extends "res://scripts/vendor/input/handlers/keyboard_handler.gd"

var player

func _init(player, scancode):
    self.player = player
    self.scancode = scancode

func handle(event):
    if event.is_pressed():
        self.player.shoot()
