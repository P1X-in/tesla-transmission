extends "res://scripts/vendor/input/handlers/abstract_handler.gd"

var scancode = null

func can_handle(event):
    if self.scancode == event.scancode:
        return true

    return false
