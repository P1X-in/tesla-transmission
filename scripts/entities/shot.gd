extends "res://scripts/vendor/entities/moving_entity.gd"

var dead_end_position = -100

func _init(board, processing).(board, processing):
    self.avatar = preload("res://scenes/player.tscn").instance()

    self.velocity = 40
    self.movement_vector = Vector3(0, 0, -1)

func process(delta):
    .process(delta)

    var position = self.get_pos()
    if position.z < self.dead_end_position:
        self.despawn()
