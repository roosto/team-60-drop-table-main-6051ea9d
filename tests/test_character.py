from unittest import TestCase
from levelup.character import Character
from levelup.direction import Direction
from fake_map import FakeMap

class TestCharacterInitWithName(TestCase):
    def test_init(self):
        ARBITRARY_NAME = "MyName"
        testobj = Character(ARBITRARY_NAME)
        self.assertEqual(ARBITRARY_NAME, testobj.name)

    def test_enter_map_sets_map_and_updates_position(self):
        testobj = Character('')
        stubbed_map = FakeMap()
        testobj.enter_map(stubbed_map)
        self.assertEqual(stubbed_map, testobj.map)
        self.assertEqual(testobj.current_position, stubbed_map.starting_position)
