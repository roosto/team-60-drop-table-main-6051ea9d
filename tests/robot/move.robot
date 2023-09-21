*** Settings ***
Documentation     I want to move my character. If they attempt to move past a boundary, the move results in no change in position.
Test Template     Move character
Library           MoveLibrary.py

*** Test Cases ***                    StartingX     StartingY     StartingMoveCount     Direction     EndingX     EndingY     EndingMoveCount

Move when in SW corner of map         3             3             50                    WEST          2           3           51
Move when in SW corner of map         0             0             5                     EAST          1           0           6
Move when in SW corner of map         0             0             3                     WEST          0           0           4
Move when in SW corner of map         0             0             10                    SOUTH         0           0           11
Move when in SW corner of map         0             0             0                     NORTH         0           1           1

Move when in NE corner of map         9             9             1                     NORTH         9           9           2
Move when in NE corner of map         9             9             99                    EAST          9           9           100
Move when in NE corner of map         9             9             100                   SOUTH         9           8           101
Move when in NE corner of map         9             9             101                   WEST          8           9           102

Move when on Eastern Edge of map      9             5             2                     EAST          9           5           3
Move when on Eastern Edge of map      9             5             3                     WEST          8           5           4

Move when on Southern Edge of map     5             0             2                     SOUTH         5           0           3
Move when on Southern Edge of map     5             0             2                     NORTH         5           1           3
Move when on Southern Edge of map     5             0             5                     WEST          4           0           5
Move when on Southern Edge of map     5             0             8                     EAST          6           0           9

Move when in center of map            5             5             0                     NORTH         5           6           1
Move when in center of map            3             3             0                     SOUTH         3           2           1
Move when in center of map            3             3             67                    EAST          4           3           68
Move when in center of map            3             3             51                    WEST          2           3           52
Move when in center of map            3             3             22                    NORTH         3           4           23

Move when in NW corner of map         0             9             7                     SOUTH         0           8           8
Move when in NW corner of map         0             9             105                   EAST          1           9           106
Move when in NW corner of map         0             9             25                    WEST          0           9           26
Move when in NW corner of map         0             9             28                    NORTH         0           9           29

Move when in SE corner of map         6             2             7                     SOUTH         6           1           8
Move when in SE corner of map         9             0             7                     SOUTH         9           0           8
Move when in SE corner of map         9             0             105                   EAST          9           0           106
Move when in SE corner of map         9             0             25                    WEST          8           0           26
Move when in SE corner of map         9             0             28                    NORTH         9           1           29

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