extends "res://scripts/vendor/entities/moving_entity.gd"

func _init(board, processing).(board, processing):
    return

func bind(board):
    self.avatar = board.get_node('player')

func move_left():
    var translation = self.avatar.get_translation()

    translation.x -= 1

    self.avatar.set_translation(translation)

func move_right():
    var translation = self.avatar.get_translation()

    translation.x += 1

    self.avatar.set_translation(translation)
