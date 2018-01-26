extends "res://scripts/vendor/input/handlers/keyboard_handler.gd"

var root

func _init(root):
    self.scancode = KEY_ESCAPE
    self.root = root

func handle(event):
    if event.is_pressed():
        self.root.get_tree().quit()
