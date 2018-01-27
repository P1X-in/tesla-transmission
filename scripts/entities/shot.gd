extends "res://scripts/vendor/entities/moving_entity.gd"

var cache

var dead_end_position = -100
var front_end_position = 2

func _init(board, processing, cache).(board, processing):
    self.avatar = preload("res://scenes/laser.tscn").instance()
    self.cache = cache

    self.velocity = 140
    self.movement_vector = Vector3(0, 0, -1)

    self.free_avatar = false
    self.type_name = 'laser'

func reverse():
    .reverse()
    self.movement_vector = Vector3(0, 0, 1)

func process(delta):
    .process(delta)

    var position = self.get_pos()
    if position.z < self.dead_end_position or position.z > self.front_end_position:
        self.despawn()
        self.cache.store_instance(self.type_name, self)

func reset():
    .reset()
    self.movement_vector = Vector3(0, 0, -1)
