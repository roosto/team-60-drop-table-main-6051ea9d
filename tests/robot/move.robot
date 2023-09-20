*** Settings ***
Documentation     I want to move my character. If they attempt to move past a boundary, the move results in no change in position.
Test Template     Move character
Library           MoveLibrary.py

*** Test Cases ***                StartingX     StartingY     StartingMoveCount     Direction     EndingX     EndingY     EndingMoveCount
Move in the middle of the map     5             5             0                     NORTH         5           6           1
Move on the corner of the map     9             9             1                     NORTH         9           9           2
Move in bottom left of the map    3             3             50                    WEST          2           3           51
Move in bottom right of map       6             2             7                     SOUTH         6           1           8
Move in the corner of map         0             0             5                     EAST          1           0           6
Move in lower left of map         0             0             3                     WEST          0           0           4
Move in lower left of map         0             0             10                    SOUTH         0           0           11
Move in lower left of map         0             0             0                     NORTH         0           1           1
Move in upper right corner of map 9             9             99                    EAST          9           9           100
Move in upper right corner of map 9             9             100                   SOUTH         9           8           101
Move in upper right corner of map 9             9             101                   WEST          8           9           102
Move in middle right of map       9             5             2                     EAST          9           5           3
Move in middle right of map       9             5             3                     WEST          8           5           4

Move 


*** Keywords ***
Move character
    [Arguments]    ${startingX}    ${startingY}    ${startingMoveCount}    ${direction}    ${endingX}    ${endingY}    ${endingMoveCount}
    Initialize character xposition with  ${startingX}
    Initialize character yposition with  ${startingY}
    Initialize character moveCount with  ${startingMoveCount}
    Move in direction                    ${direction}
    Character xposition should be        ${endingX}
    Character yposition should be        ${endingY}
    Character moveCount should be        ${endingMoveCount}