extends "res://scripts/vendor/input/handlers/keyboard_handler.gd"

var bag

func _init(bag):
    self.scancode = KEY_D
    self.bag = bag

func handle(event):
    if event.is_pressed():
        self.bag.players.player1.ship.move_right()
