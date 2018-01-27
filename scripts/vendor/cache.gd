
var instance_cache = {}

func store_instance(type, object):
    if not self.instance_cache.has(type):
        self.instance_cache[type] = []

    self.instance_cache[type].push_back(object)

func request(type):
    if not self.instance_cache.has(type) or self.instance_cache[type].size() == 0:
        return null

    return self.instance_cache[type].pop_back()
