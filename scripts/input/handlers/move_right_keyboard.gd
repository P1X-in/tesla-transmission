extends "res://scripts/vendor/input/handlers/keyboard_handler.gd"

var ship

func _init(ship):
    self.scancode = KEY_D
    self.ship = ship

func handle(event):
    if event.is_pressed():
        self.ship.move_right()