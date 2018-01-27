extends "res://scripts/vendor/input/handlers/gamepad_button_handler.gd"

var player

func _init(button_index, player):
    self.button_index = button_index
    self.player = player

func handle(event):
    self.player.set_shooting(event.is_pressed())
