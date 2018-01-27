
var processing
var players

var ship

var path

func _init(processing, players, ship, path):
    self.processing = processing
    self.players = players
    self.ship = ship
    self.path = path

func process(delta):
    var objective = self._get_objective_for_this_tick()
    self._head_towards_objective(objective)

func spawn():
    self.processing.register(self)
    self.ship.spawn(self.path.get_initial_position())

func despawn():
    self.processing.remove(self)
    self.ship.despawn()

func _get_objective_for_this_tick():
    var ship_position = self.ship.get_pos()
    var player_positions = self.players.get_positions()

    return {
        'target' : self.path.get_next_target(ship_position, player_positions),
        'speed' : self.path.get_current_speed(ship_position, player_positions),
        'shooting' : self.path.get_shooting(ship_position, player_positions),
        'current_position' : ship_position
    }

func _head_towards_objective(objective):
    var movement_vector = objective['target'] - objective['current_position']
    movement_vector = movement_vector.normalized()

    self.ship.shooting = objective['shooting']
    self.ship.movement_vector = movement_vector
    self.ship.velocity = objective['speed']
