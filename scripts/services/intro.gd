extends "res://scripts/vendor/bag_aware.gd"

var scene

func _initialize():
    self.scene = self.bag.root.get_node("intro")

func show():
    self.scene.show()

func hide():
    self.scene.hide()
