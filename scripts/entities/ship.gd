extends "res://scripts/vendor/entities/moving_entity.gd"

var timers
var cache
var shots_factory

var shot_template_name = 'laser'
var enemy_shot_template_name = 'laser_red'

var tesla_shot_template_name = 'tesla_shot'
var tesla_cooldown = 0.4
var tesla_on_cooldown = false

var shot_spawn_offset = [Vector3(0, 0, -3.5)]
var tesla_spawn_offset = [Vector3(0, 0, -3.5)]
var shot_cooldown = 0.1
var shot_on_cooldown = false
var shooting = false
var tesla_shooting = false
var die_on_collision = false
var enemy
var player

func _init(board, processing, timers, cache).(board, processing):
    self.avatar = preload("res://scenes/lowpoly_ship2.tscn").instance()
    self.timers = timers
    self.cache = cache

    self.velocity = 24
    self.position_constraint_positive = Vector3(10, 11, 0)
    self.position_constraint_negative = Vector3(-10, 0.5, 0)
    self.constrain_position = true

    self.free_avatar = false
    self.type_name = 'ship'
    self.default_rotation = 90

func set_player_collisions():
    self.avatar.set_collision_layer(1)
    self.avatar.set_collision_mask(1)

func set_enemy_collisions():
    self.avatar.set_collision_layer(0)
    self.avatar.set_collision_mask(1)


func spawn_shot():
    if self.shot_on_cooldown:
        return

    var shot
    var position

    for shot_offset in self.shot_spawn_offset:
        shot = self._get_shot_instance()

        if self.reversed:
            shot.reverse()
            shot_offset.z = -shot_offset.z

        position = self.get_pos() + shot_offset

        shot.set_collisions(self.avatar.get_collision_layer(), self.avatar.get_collision_mask())
        shot.player = self.player
        shot.spawn(position)
    self.shot_on_cooldown = true
    self.timers.set_timeout(self.shot_cooldown, self, "remove_cooldown")

func spawn_tesla_shot():
    if self.tesla_on_cooldown:
        return

    var shot
    var position

    for shot_offset in self.tesla_spawn_offset:
        shot = self._get_tesla_shot_instance()
        position = self.get_pos() + shot_offset

        shot.set_collisions(self.avatar.get_collision_layer(), self.avatar.get_collision_mask())
        shot.player = self.player
        shot.spawn(position)
    self.put_tesla_on_cooldown()

func remove_cooldown():
    self.shot_on_cooldown = false

func put_tesla_on_cooldown():
    self.tesla_on_cooldown = true
    self.timers.set_timeout(self.tesla_cooldown, self, "remove_tesla_cooldown")

func remove_tesla_cooldown():
    self.tesla_on_cooldown = false

func process(delta):
    .process(delta)

    if self.shooting:
        self.spawn_shot()

    if self.tesla_shooting:
        self.spawn_tesla_shot()

    if self.enemy != null and self.collision != null and self.die_on_collision:
        self.enemy.despawn()

func _get_shot_instance():
    var object

    if self.enemy != null:
        object = self.shots_factory.get(self.enemy_shot_template_name)
    else:
        object = self.shots_factory.get(self.shot_template_name)

    return object

func _get_tesla_shot_instance():
    var object = self.shots_factory.get(self.tesla_shot_template_name)

    return object

func despawn():
    .despawn()
    self.cache.store_instance(self.type_name, self)

func reset():
    .reset()
    self.shooting = false
    self.tesla_shooting = false
    self.shot_on_cooldown = false
    self.tesla_cooldown = false
    self.shot_cooldown = 0.1
    self.die_on_collision = false
    self.constrain_position = true
    self.enemy = null
    self.player = null
    self.avatar.set_collision_layer(1)
    self.avatar.set_collision_mask(1)
