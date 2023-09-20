*** Settings ***
Documentation   I want to move my character. If they attempt to move past a boundary, the move results in no change in position.
Test Template   Move character
Library         MoveLibrary.py

*** Test Cases ***      StartingX      StartingY    Direction   EndingX EndingY
Move in middle of board 0               0           NORTH       0       1   
Move on edge of board   0               0           SOUTH       0       0

*** Keywords ***
Move character
    [Arugement] ${startingX}    ${startingY}    ${direction}    ${endingX}  ${endingY}
    Intiatialize character xposition with ${startingX}
    Intiatialize character ypostion with ${startingY}
    Move in direction               ${direction}
    Character xposition should be   ${endingX}
    Character ypostion should be    ${endingY} 

    *** Settings ***
    Documentation
    ***     Example test casee using the data-driven (table) syntax.
    ***     http://arcbotics.com/wp-content/uploads/2015/12/sparki-driver-icon.png