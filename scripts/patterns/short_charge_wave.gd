extends "res://scripts/patterns/abstract_pattern.gd"

var altitude
var amount

func _init(timers, enemies, cache, altitude, amount).(timers, enemies, cache):
    self.altitude = altitude
    self.amount = amount

    self.generate_waves()


func apply(params):
    self.altitude = params['altitude']
    self.amount = params['amount']

    self.generate_waves()

func generate_waves():
    for i in range(self.amount):
        self.pattern.append(self._generate_step())

func _generate_step():
    return {
        'path_type' : 'short_charge',
        'ship_type' : 'medusa',
        'timeout' : 0.5,
        'path_params' : {
            'altitude' : self.altitude
        }
    }
