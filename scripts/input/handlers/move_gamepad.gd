extends "res://scripts/vendor/input/handlers/gamepad_motion_handler.gd"

var player

func _init(player):
    self.axis = -1
    self.player = player

func handle(event):
    if not self.player.is_active():
        return

    var value = event.axis_value

    if abs(value) < 0.3:
        value = 0

    if event.axis == 0:
        self.player.ship.movement_vector.x = value
    elif event.axis == 1:
        self.player.ship.movement_vector.y = -value
