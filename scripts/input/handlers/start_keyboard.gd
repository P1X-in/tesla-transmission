extends "res://scripts/vendor/input/handlers/keyboard_handler.gd"

var board

func _init(board):
    self.scancode = KEY_SPACE
    self.board = board

func handle(event):
    if event.is_pressed():
        board.start_game()
