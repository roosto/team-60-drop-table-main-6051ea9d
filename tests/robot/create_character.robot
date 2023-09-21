*** Settings ***
Documentation     I want to create a new custom character, setting only their name. 
Test Template     Create character
Library           CreateCharacterLibrary.py

*** Test Cases ***      characterNameInput     characterNameOutput
Provided name           Bozo                   Bozo
Default name            ${EMPTY}               Character

*** Keywords ***
Create character
    [Arguments]    ${characterNameInput}    ${characterNameOutput}
    Provide character name      ${characterNameInput}
    Create the character
    Character name is           ${characterNameOutput}