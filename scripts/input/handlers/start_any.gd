extends "res://scripts/vendor/input/handlers/abstract_handler.gd"

var board

func _init(board):
    self.board = board

func can_handle(event):
    return true

func handle(event):
    board.start_game()
