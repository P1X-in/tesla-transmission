extends "res://scripts/vendor/input/handlers/abstract_handler.gd"

func can_handle(event):
    if event is InputEventMouseMotion:
        return true

    return false
