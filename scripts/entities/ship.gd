extends "res://scripts/vendor/entities/moving_entity.gd"

var timers

var shot_template = preload("res://scripts/entities/shot.gd")
var shot_spawn_offset = Vector3(0, 0, -3)
var shot_cooldown = 0.1
var shot_on_cooldown = false
var shooting = false

func _init(board, processing, timers).(board, processing):
    self.avatar = preload("res://scenes/player.tscn").instance()
    self.timers = timers

    self.velocity = 15
    self.position_constraint_positive = Vector3(10, 11, 0)
    self.position_constraint_negative = Vector3(-10, 0.5, 0)
    self.constrain_position = true

func spawn_shot():
    if self.shot_on_cooldown:
        return

    var shot = self.shot_template.new(self.board, self.processing)
    var position = self.get_pos() + self.shot_spawn_offset

    shot.spawn(position)
    self.shot_on_cooldown = true
    self.timers.set_timeout(self.shot_cooldown, self, "remove_cooldown")

func remove_cooldown():
    self.shot_on_cooldown = false

func process(delta):
    .process(delta)

    if self.shooting:
        self.spawn_shot()
