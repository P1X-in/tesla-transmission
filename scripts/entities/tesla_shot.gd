extends "res://scripts/entities/shot.gd"

func _init(board, processing, cache).(board, processing, cache):
    self.avatar = preload("res://scenes/tesla_shot.tscn").instance()

    self.type_name = 'tesla_shot'

func process(delta):
    if self.collision != null:
        self._tesla_colision(self.collision.collider)

    .process(delta)

func _tesla_colision(collider):
    self.player.swap_ship(collider.ship_name)
