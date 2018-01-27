extends "res://scripts/vendor/input/handlers/keyboard_handler.gd"

const MOVEMENT_VALUE = 1

var player
var axis
var direction

func _init(player, axis, direction, scancode):
    self.player = player
    self.axis = axis
    self.direction = direction
    self.scancode = scancode

func handle(event):
    if event.is_echo():
        return

    if event.is_pressed():
        self._apply_movement(self.direction)
    else:
        self._apply_movement(0)

func _apply_movement(direction):
    if not self.player.is_active():
        return

    var movement_vector = self.player.ship.movement_vector

    if self.axis == "x":
        movement_vector.x = self.MOVEMENT_VALUE * direction
    elif self.axis == "y":
        movement_vector.y = self.MOVEMENT_VALUE * direction

    self.player.ship.movement_vector = movement_vector
