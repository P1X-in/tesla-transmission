extends "res://scripts/vendor/input/handlers/keyboard_handler.gd"

var player

func _init(player, scancode):
    self.scancode = scancode
    self.player = player

func handle(event):
    if event.is_pressed():
        self.player.enter_game()
