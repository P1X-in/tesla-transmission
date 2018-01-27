extends "res://scripts/vendor/entities/moving_entity.gd"

var dead_end_position = -100
var front_end_position = 1

func _init(board, processing).(board, processing):
    self.avatar = preload("res://scenes/laser.tscn").instance()

    self.velocity = 140
    self.movement_vector = Vector3(0, 0, -1)

func process(delta):
    .process(delta)

    var position = self.get_pos()
    if position.z < self.dead_end_position or position.z > self.front_end_position:
        self.despawn()
