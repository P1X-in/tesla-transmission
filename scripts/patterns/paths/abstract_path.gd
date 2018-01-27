
var initial_position = Vector3(0, 0, 0)

var path = {}
var current_step = 'waypoint1'

func get_initial_position():
    return self.initial_position

func get_next_target(ship_position, player_positions):
    self._check_change_waypoint(ship_position)

    return self.path[self.current_step]['target']

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
    var distance = ship_position.distance_squared_to(current_target['target'])

    if distance < current_target['threshold']:
        return true

    return false

