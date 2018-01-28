extends "res://scripts/patterns/abstract_pattern.gd"

var distance
var amount

func _init(timers, enemies, cache, distance, amount).(timers, enemies, cache):
    self.distance = distance
    self.amount = amount

    self.generate_waves()


func apply(params):
    self.distance = params['distance']
    self.amount = params['amount']

    self.generate_waves()

func generate_waves():
    for i in range(self.amount):
        self.pattern.append(self._generate_step())

func _generate_step():
    return {
        'path_type' : 'square',
        'ship_type' : 'gaia',
        'timeout' : 1,
        'path_params' : {
            'distance' : self.distance
        }
    }
