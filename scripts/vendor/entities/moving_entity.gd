extends "res://scripts/vendor/entities/entity.gd"

var processing

var velocity
var movement_vector = Vector3(0, 0, 0)

var position_constraint_positive = Vector3(0, 0, 0)
var position_constraint_negative = Vector3(0, 0, 0)
var constrain_position = false

var collision

func _init(board, processing).(board):
    self.processing = processing

func spawn(position):
    .spawn(position)
    self.processing.register(self)

func despawn():
    self.processing.remove(self)
    .despawn()

func reset():
    self.movement_vector = Vector3()

func process(delta):
    self._modify_position(delta)
    self._constrain_position()

func _modify_position(delta):
    var motion

    motion = self.movement_vector * self.velocity * delta
    self.collision = self.avatar.move_and_collide(motion)

func _constrain_position():
    if not self.constrain_position:
        return

    var position = self.get_pos()

    position.x = min(position.x, self.position_constraint_positive.x)
    position.y = min(position.y, self.position_constraint_positive.y)
    position.z = min(position.z, self.position_constraint_positive.z)

    position.x = max(position.x, self.position_constraint_negative.x)
    position.y = max(position.y, self.position_constraint_negative.y)
    position.z = max(position.z, self.position_constraint_negative.z)

    self.set_pos(position)
