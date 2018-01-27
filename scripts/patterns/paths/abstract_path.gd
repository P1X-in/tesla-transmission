
func get_initial_position():
    return Vector3(0, 0, 0)

func get_next_target(ship_position, player_positions):
    return Vector3(0, 0, 0)

func get_current_speed(ship_position, player_positions):
    return 1

func get_shooting(ship_position, player_positions):
    return false

func should_despawn(ship_position):
    return false

func get_shot_cooldown(ship_position):
    return 1
