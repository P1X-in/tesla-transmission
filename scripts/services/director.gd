
const DEBUG = true

var timers
var patterns_factory

var iterator = 0
var started = false

var waves = [
    {
        'type' : 'side_front_wave',
        'params' : {
            'altitude' : 2,
            'amount' : 3
        },
        'delay' : 3
    },

    {
        'type' : 'side_front_wave',
        'params' : {
            'altitude' : 2,
            'amount' : 3,
            'reversed' : true
        },
        'delay' : 3
    },

    {
        'type' : 'side_front_wave',
        'params' : {
            'altitude' : 0.7,
            'amount' : 10
        },
        'delay' : 0.5
    },

    {
        'type' : 'side_front_wave',
        'params' : {
            'altitude' : 8,
            'amount' : 10,
            'reversed' : true
        },
        'delay' : 5
    },

    {
        'type' : 'wall_wave',
        'params' : {
            'distance' : -30,
            'reversed' : false
        },
        'delay' : 5
    },

    {
        'type' : 'wall_wave',
        'params' : {
            'distance' : -20,
            'reversed' : true
        },
        'delay' : 10
    },

    {
        'type' : 'top_bottom_wave',
        'params' : {
            'altitude' : 8,
            'amount' : 10,
        },
        'delay' : 10
    },

    {
        'type' : 'top_bottom_wave',
        'params' : {
            'altitude' : 8,
            'amount' : 10,
            'reversed_x' : true,
            'reversed_y' : true,
        },
        'delay' : 10
    },

    {
        'type' : 'top_bottom_wave',
        'params' : {
            'altitude' : 8,
            'amount' : 10,
            'reversed_y' : true
        },
        'delay' : 10
    },

    {
        'type' : 'top_bottom_wave',
        'params' : {
            'altitude' : 8,
            'amount' : 10,
            'reversed_x' : true,
        },
        'delay' : 10
    },

    {
        'type' : 'side_front_wave',
        'params' : {
            'altitude' : 1,
            'amount' : 10
        },
        'delay' : 0.1
    },

    {
        'type' : 'side_front_wave',
        'params' : {
            'altitude' : 6,
            'amount' : 10,
            'reversed_x' : true
        },
        'delay' : 0.1
    },

    {
        'type' : 'side_front_wave',
        'params' : {
            'altitude' : 10,
            'amount' : 10
        },
        'delay' : 8
    },

    {
        'type' : 'side_front_wave',
        'params' : {
            'altitude' : 1,
            'amount' : 10,
            'reversed_x' : true
        },
        'delay' : 0.1
    },

    {
        'type' : 'side_front_wave',
        'params' : {
            'altitude' : 6,
            'amount' : 10
        },
        'delay' : 0.1
    },

    {
        'type' : 'side_front_wave',
        'params' : {
            'altitude' : 10,
            'amount' : 10,
            'reversed_x' : true
        },
        'delay' : 8
    },

    {
        'type' : 'side_front_wave',
        'params' : {
            'altitude' : 1,
            'amount' : 10
        },
        'delay' : 0.1
    },

    {
        'type' : 'side_front_wave',
        'params' : {
            'altitude' : 6,
            'amount' : 10
        },
        'delay' : 0.1
    },

    {
        'type' : 'side_front_wave',
        'params' : {
            'altitude' : 10,
            'amount' : 10
        },
        'delay' : 8
    },

    {
        'type' : 'side_front_wave',
        'params' : {
            'altitude' : 1,
            'amount' : 10,
            'reversed_x' : true
        },
        'delay' : 0.1
    },

    {
        'type' : 'side_front_wave',
        'params' : {
            'altitude' : 6,
            'amount' : 10,
            'reversed_x' : true
        },
        'delay' : 0.1
    },

    {
        'type' : 'side_front_wave',
        'params' : {
            'altitude' : 10,
            'amount' : 10,
            'reversed_x' : true
        },
        'delay' : 8
    },

    {
        'type' : 'top_bottom_wave',
        'params' : {
            'altitude' : 8,
            'amount' : 10,
        },
        'delay' : 10
    },

    {
        'type' : 'top_bottom_wave',
        'params' : {
            'altitude' : 8,
            'amount' : 10,
            'reversed_x' : true,
            'reversed_y' : true,
        },
        'delay' : 10
    },

    {
        'type' : 'top_bottom_wave',
        'params' : {
            'altitude' : 8,
            'amount' : 10,
            'reversed_y' : true
        },
        'delay' : 10
    },

    {
        'type' : 'top_bottom_wave',
        'params' : {
            'altitude' : 8,
            'amount' : 10,
            'reversed_x' : true,
        },
        'delay' : 12
    },

    {
        'type' : 'short_charge_wave',
        'params' : {
            'altitude' : 6,
            'amount' : 10,
        },
        'delay' : 0.1
    },

    {
        'type' : 'short_charge_wave',
        'params' : {
            'altitude' : 6,
            'amount' : 10,
            'reversed_x' : true,
        },
        'delay' : 10
    },

    {
        'type' : 'short_charge_wave',
        'params' : {
            'altitude' : 1,
            'amount' : 10,
            'reversed_x' : true,
        },
        'delay' : 0.1
    },

    {
        'type' : 'short_charge_wave',
        'params' : {
            'altitude' : 11,
            'amount' : 10,
        },
        'delay' : 10
    },

    {
        'type' : 'short_charge_wave',
        'params' : {
            'altitude' : 1,
            'amount' : 10,
        },
        'delay' : 0.1
    },

    {
        'type' : 'short_charge_wave',
        'params' : {
            'altitude' : 11,
            'amount' : 10,
            'reversed_x' : true,
        },
        'delay' : 10
    },

    {
        'type' : 'short_charge_wave',
        'params' : {
            'altitude' : 1,
            'amount' : 10,
        },
        'delay' : 0.1
    },

    {
        'type' : 'short_charge_wave',
        'params' : {
            'altitude' : 6,
            'amount' : 10,
        },
        'delay' : 0.1
    },

    {
        'type' : 'short_charge_wave',
        'params' : {
            'altitude' : 11,
            'amount' : 10,
        },
        'delay' : 0.1
    },

    {
        'type' : 'short_charge_wave',
        'params' : {
            'altitude' : 1,
            'amount' : 10,
            'reversed_x' : true,
        },
        'delay' : 0.1
    },

    {
        'type' : 'short_charge_wave',
        'params' : {
            'altitude' : 6,
            'amount' : 10,
            'reversed_x' : true,
        },
        'delay' : 0.1
    },

    {
        'type' : 'short_charge_wave',
        'params' : {
            'altitude' : 11,
            'amount' : 10,
            'reversed_x' : true,
        },
        'delay' : 10
    },

    {
        'type' : 'wall_wave',
        'params' : {
            'distance' : -50,
        },
        'delay' : 10
    },

    {
        'type' : 'wall_wave',
        'params' : {
            'distance' : -40,
            'reversed' : true
        },
        'delay' : 10
    },

    {
        'type' : 'wall_wave',
        'params' : {
            'distance' : -30,
        },
        'delay' : 10
    },

    {
        'type' : 'wall_wave',
        'params' : {
            'distance' : -20,
            'reversed' : true
        },
        'delay' : 10
    },

    {
        'type' : 'wall_wave',
        'params' : {
            'distance' : -10,
        },
        'delay' : 10
    },

    {
        'type' : 'square_charge_wave',
        'params' : {
            'distance' : -10,
            'amount' : 10,
        },
        'delay' : 10
    },

    {
        'type' : 'square_charge_wave',
        'params' : {
            'distance' : -20,
            'amount' : 10,
            'reversed' : true
        },
        'delay' : 10
    },

    {
        'type' : 'square_charge_wave',
        'params' : {
            'distance' : -30,
            'amount' : 10,
        },
        'delay' : 10
    },

    {
        'type' : 'square_charge_wave',
        'params' : {
            'distance' : -40,
            'amount' : 10,
            'reversed' : true
        },
        'delay' : 10
    },

    {
        'type' : 'square_charge_wave',
        'params' : {
            'distance' : -50,
            'amount' : 10,
        },
        'delay' : 10
    },
]


func _initialize(timers, factory):
    self.timers = timers
    self.patterns_factory = factory

func start():
    if self.started:
        return

    self.started = true
    self.iterator = 0

    self._perform_next_wave()

func abort():
    self.started = false
    self.iterator = 0

func _perform_next_wave():
    if self.is_finished() or not self.started:
        return

    self._perofrm_wave()
    var delay = self.waves[self.iterator]['delay']
    self.iterator += 1

    self.timers.set_timeout(delay, self, '_perform_next_wave')

func _perofrm_wave():
    var wave_data = self.waves[self.iterator]

    var pattern = self.patterns_factory.get(wave_data['type'], wave_data['params'])

    if self.DEBUG:
        print("performing: " + wave_data['type'])
    pattern.begin()

func is_finished():
    return self.iterator == self.waves.size()
