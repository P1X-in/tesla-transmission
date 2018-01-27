
var mount
var attached_entities = {}

func attach_entity(entity):
    if self.mount == null or self._is_attached(entity):
        return

    self.attached_entities[entity.get_instance_id()] = entity
    self.mount.add_child(entity)

func detach_entity(entity):
    if self.mount == null or not self._is_attached(entity):
        return

    self.attached_entities.erase(entity.get_instance_id())
    self.mount.remove_child(entity)

func clear_all_entitys():
    for entity in self.attached_entities:
        self.detach_entity(entity)

func _is_attached(entity):
    return self.attached_entities.has(entity.get_instance_id())
