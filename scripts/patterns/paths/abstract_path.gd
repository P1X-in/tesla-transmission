
var Y_TOP = 12

var initial_position = Vector3(0, 0, 0)

var path = {}
var current_step = 'waypoint1'

var reversed_x = false
var reversed_y = false

func get_initial_position():
    var position = self.initial_position
    if self.reversed_x:
        position.x = -position.x
    if self.reversed_y:
        position.y = self.Y_TOP - position.y

    return position

func get_next_target(ship_position, player_positions):
    var position
    self._check_change_waypoint(ship_position)

    position = self.path[self.current_step]['target']
    position = Vector3(position.x, position.y, position.z)

    if self.reversed_x:
        position.x = -position.x

    if self.reversed_y:
        position.y = self.Y_TOP - position.y

    return position

func get_current_speed(ship_position, player_positions):
    return self.path[self.current_step]['speed']

func get_shooting(ship_position, player_positions):
    return self.path[self.current_step]['shooting']

func should_despawn(ship_position):
    return self.path[self.current_step]['despawn']

func get_shot_cooldown(ship_position):
    return self.path[self.current_step]['shot_cooldown']

func _check_change_waypoint(ship_position):
    if self._is_close(ship_position):
        self.current_step = self.path[self.current_step]['next']

func _is_close(ship_position):
    var current_target = self.path[self.current_step]
    var position = current_target['target']

    position = Vector3(position.x, position.y, position.z)

    if self.reversed_x:
        position.x = -position.x

    if self.reversed_y:
        position.y = self.Y_TOP - position.y

    var diff_x = abs(ship_position.x - position.x)
    var diff_y = abs(ship_position.y - position.y)
    var diff_z = abs(ship_position.z - position.z)

    if diff_x < current_target['threshold'] and diff_y < current_target['threshold'] and diff_z < current_target['threshold']:
        return true

    return false

