extends "res://scripts/patterns/abstract_pattern.gd"

var altitude
var amount

func _init(timers, enemies, cache, altitude, amount).(timers, enemies, cache):
    self.altitude = altitude
    self.amount = amount

    self._generate_wave()

func _generate_wave():
    for i in range(self.amount):
        self.pattern.append(self._generate_step())

func _generate_step():
    return {
        'path_type' : 'side_front_curve',
        'ship_type' : 'ship',
        'timeout' : 0.5
        'path_params' : {
            'altitude' : self.altitude
        }
    }