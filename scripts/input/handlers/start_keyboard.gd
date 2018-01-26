extends "res://scripts/vendor/input/handlers/keyboard_handler.gd"

var bag

func _init(bag):
    self.scancode = KEY_SPACE
    self.bag = bag

func handle(event):
    if event.is_pressed():
        self.bag.root.add_child(self.bag.test)
