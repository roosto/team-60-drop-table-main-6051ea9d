from levelup.position import Position
from levelup.map import Map
from levelup.direction import Direction

class Character:
    name = ""
    map :Map = None
    current_position :Position = None

    def __init__(self, character_name):
        self.name = character_name
    
    def enter_map(self, new_map: Map):
        self.map = new_map
        self.current_position = self.map.starting_position

    def move(self, direction :Direction) -> None:
        self.current_position = self.map.calculate_new_position(
            self.current_position, direction)