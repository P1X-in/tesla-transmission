extends "res://scripts/vendor/input/handlers/keyboard_handler.gd"

var ship

func _init(ship):
    self.scancode = KEY_A
    self.ship = ship

func handle(event):
    if event.is_pressed() and not event.is_echo():
        return
    else:
        return
