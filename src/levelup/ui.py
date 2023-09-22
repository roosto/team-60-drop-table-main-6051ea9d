import logging
import pyfiglet
from typing import Callable
from levelup.controller import GameController, Direction, InvalidMoveException

VALID_DIRECTIONS = [x.value for x in Direction]

class GameApp:

    controller: GameController

    def __init__(self):
        self.controller = GameController()
        self.load_banner()
        self.load_dragon()
        self.load_progress_bar()
        self.load_legal_disclaimer()

    def load_banner(self):
        ascii_banner = pyfiglet.figlet_format("eXtreme \n KINGDOMS")
        print(ascii_banner)

    def load_progress_bar(self):
        print('\n\n Loading ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ 100% complete')

    def load_legal_disclaimer(self):
        print('\nThe unauthorized reproduction or distribution of a copyrighted work is illegal. \nCriminal copyright infringement is investigated by federal law enforcement agencies \nand is punishable by up to five years in prison and a fine of $250,000. ')
        print('\nLevelup Games LLC - All Rights Reserved')

    def load_dragon(self):
        file_path = '../assets/Dragon.txt'
        try:
            with open(file_path, "r") as file:
                # Read the contents of the file and print them
                file_contents = file.read()
                print(file_contents)
        except FileNotFoundError:
            print(f"File '{file_path}' not found.")
        except Exception as e:
            print(f"An error occurred: {str(e)}")

    def prompt(self, menu: str, validation_fn: Callable[[str], bool]) -> str:
        while True:
            response = input(f"\n{menu}\n> ")
            if validation_fn(response):
                break
        return response

    def create_character(self):
        character = self.prompt("Enter character name", lambda x: len(x) > 0)
        self.controller.create_character(character)

    def move_loop(self):
        while True:
            response = self.prompt(
                f"Where would you like to go? {VALID_DIRECTIONS}\n(or ctrl+c to quit)",
                lambda x: x in VALID_DIRECTIONS,
            )
            direction = Direction(response)
            try:
                self.controller.move(direction)
            except InvalidMoveException:
                print(f"You cannot move {direction}")
            else:
                print(f"You moved {direction.name}")
            print(self.controller.status)

    def start(self):
        self.create_character()
        self.controller.start_game()
        self.move_loop()

    def quit(self):
        print(f"\n\n{self.controller.status}")
