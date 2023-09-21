from levelup.map import Map
from levelup.position import Position
from levelup.controller import Direction

class FakeMap (Map):

    STUBBED_X = 3
    STUBBED_Y = 4

    starting_position = Position(STUBBED_X, STUBBED_Y)

    def calculate_new_position(self, current_position: Position, direction: Direction) -> Position:
        return starting_position
