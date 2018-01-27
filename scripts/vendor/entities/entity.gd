
var board

var avatar
var is_processing = false
var free_avatar = true
var initial_position = Vector3(0, 0, 0)

func _init(board):
    self.board = board

func get_pos():
    return self.avatar.get_pos()

func set_pos(position):
    self.avatar.set_pos(position)

func spawn(position):
    self.attach()
    self.initial_position = position
    self.avatar.set_pos(self.initial_position)

func despawn():
    self.is_processing = false
    self.detach()
    if self.free_avatar:
        self.avatar.queue_free()

func attach():
    self.is_processing = true
    self.board.attach_entity(self.avatar)

func detach():
    self.is_processing = false
    self.board.detach_entity(self.avatar)

func calculate_distance_to_object(object):
    return self.calculate_distance(object.get_pos())

func calculate_distance(their_position):
    return their_position.distance_to(self.get_pos())

