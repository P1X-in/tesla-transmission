extends "res://scripts/vendor/entities/moving_entity.gd"

var timers
var cache

var shot_template = preload("res://scripts/entities/shot.gd")
var shot_template_name = 'laser'
var shot_spawn_offset = Vector3(0, 0, -2.5)
var shot_cooldown = 0.1
var shot_on_cooldown = false
var shooting = false
var die_on_collision = false
var enemy

func _init(board, processing, timers, cache).(board, processing):
    self.avatar = preload("res://scenes/player.tscn").instance()
    self.timers = timers
    self.cache = cache

    self.velocity = 24
    self.position_constraint_positive = Vector3(10, 11, 0)
    self.position_constraint_negative = Vector3(-10, 0.5, 0)
    self.constrain_position = true

    self.free_avatar = false
    self.type_name = 'ship'
    self.default_rotation = 90

func reverse():
    .reverse()
    self.shot_spawn_offset.z = -self.shot_spawn_offset.z


func spawn_shot():
    if self.shot_on_cooldown:
        return

    var shot = self._get_shot_instance()
    var position = self.get_pos() + self.shot_spawn_offset

    if self.reversed:
        shot.reverse()

    shot.spawn(position)
    self.shot_on_cooldown = true
    self.timers.set_timeout(self.shot_cooldown, self, "remove_cooldown")

func remove_cooldown():
    self.shot_on_cooldown = false

func process(delta):
    .process(delta)

    if self.shooting:
        self.spawn_shot()

    if self.enemy != null and self.collision != null and self.die_on_collision:
        self.enemy.despawn()

func _get_shot_instance():
    var object = self.cache.request(self.shot_template_name)

    if object != null:
        object.reset()
        return object

    return self.shot_template.new(self.board, self.processing, self.cache)

func despawn():
    .despawn()
    self.cache.store_instance(self.type_name, self)

func reset():
    .reset()
    self.shooting = false
    self.shot_on_cooldown = false
    self.shot_cooldown = 0.1
    self.die_on_collision = false
    self.constrain_position = true
    self.enemy = null
    self.shot_spawn_offset = Vector3(0, 0, -2.5)
