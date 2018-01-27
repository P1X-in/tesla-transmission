extends "res://scripts/vendor/input/handlers/abstract_handler.gd"

var axis

func can_handle(event):
    if event is InputEventJoypadMotion and (self.axis == event.axis or self.axis == -1):
        return true

    return false
