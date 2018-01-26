extends "res://scripts/vendor/input/handlers/abstract_handler.gd"

var axis

func can_handle(event):
    if event is InputEventJoypadMotion and handler.axis == event.axis:
        return true

    return false
