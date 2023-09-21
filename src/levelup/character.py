from levelup.map import Map

class Character:
    name = ""
    map = None
    current_position = None

    def __init__(self, character_name):
        self.name = character_name
    
    def enter_map(self, new_map: Map):
        self.map = new_map
        self.current_position = self.map.starting_position
