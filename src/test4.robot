
*** Settings ***
Library  AppiumLibrary
Suite Setup  Connect Android
Suite Teardown  Close Todo Application

# Author: Aniwat Ruttanaudom

*** Test Cases ***
Verify Create with blank name
    Wait Until Page Contains Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB 
    Click Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Wait Until Element Is Visible  id=com.avjindersinghsekhon.minimaltodo:id/toDoCustomTextInput
    Input Text  id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText  ${EMPTY}
    Click Element  id=com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton
    Wait Until Page Contains Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Page Should Contain Text  You don't have any todos

Create task happy case
    Wait Until Page Contains Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Click Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Wait Until Element Is Visible  id=com.avjindersinghsekhon.minimaltodo:id/toDoCustomTextInput
    Input Text  id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText  Task and Reminder
    Click Element  id=com.avjindersinghsekhon.minimaltodo:id/toDoHasDateSwitchCompat
    Click Element  id=com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton
    Wait Until Page Contains Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Page Should Contain Text  Task and Reminder
    Page Should Contain Element  id=com.avjindersinghsekhon.minimaltodo:id/todoListItemTimeTextView

Create task without reminder
    Wait Until Page Contains Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Click Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Wait Until Element Is Visible  id=com.avjindersinghsekhon.minimaltodo:id/toDoCustomTextInput
    Input Text  id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText  Task without Reminder
    Click Element  id=com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton
    Wait Until Page Contains Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Page Should Contain Text  Task without Reminder
    Page Should be not contain element Todo  id=com.avjindersinghsekhon.minimaltodo:id/todoListItemTimeTextView

Verify Edit with blank name 
    Wait Until Page Contains Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Click Element  css=[text="Task and Reminder"]
    Wait Until Page Contains Element  id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText 
    Clear Text  id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText  
    Input Text  id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText  ${EMPTY}
    Click Element  id=com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton
    Wait Until Page Contains Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Page Should Contain Text  Task and Reminder
    Page Should Contain Element  id=com.avjindersinghsekhon.minimaltodo:id/todoListItemTimeTextView

Verify Edit Task
    Wait Until Page Contains Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Click Element  css=[text="Task and Reminder"]
    Wait Until Page Contains Element  id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText 
    Clear Text  id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText  
    Input Text  id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText  Edited Task
    Click Element  id=com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton
    Wait Until Page Contains Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Page Should Contain Text  Edited Task
    Page Should Contain Element  id=com.avjindersinghsekhon.minimaltodo:id/todoListItemTimeTextView

Verify Delelte task and Undo
    Wait Until Page Contains Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Page Should Contain Text  Task without Reminder
    Swipe Right to Left  css=[text="Task without Reminder"]
    Click Element  css=[text="UNDO"]
    Wait Until Page Contains Element  css=[text="Task without Reminder"][resource-id="com.avjindersinghsekhon.minimaltodo:id/toDoListItemTextview"]
    Page Should Contain Text  Task without Reminder

Verify Delelte task Successful
    Wait Until Page Contains Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Page Should Contain Text  Edited Task
    Swipe Right to Left  css=[text="Edited Task"]
    Page Should Contain Text  Deleted Todo
    Page Should Not Contain Text  Edited Task


Verify Create duplicate name
    Wait Until Page Contains Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Click Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Wait Until Element Is Visible  id=com.avjindersinghsekhon.minimaltodo:id/toDoCustomTextInput
    Input Text  id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText  Task without Reminder
    Click Element  id=com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton
    Wait Until Page Contains Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Todo should allow duplicated name  id=com.avjindersinghsekhon.minimaltodo:id/toDoListItemTextview

Verify settings 
    Wait Until Page Contains Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Click Element  css=[content-desc="More options"]
    Wait Until Page Contains Element  css=[text="Settings"]
    Click Element  css=[text="Settings"]
    Page Should Contain Text  Night Mode
    Page Should Contain Text  Night mode is off
    Click Element  id=android:id/checkbox
    Page Should Contain Text  Night mode is on
    Click Element  id=android:id/checkbox
    Press Keycode  4

Verify About 
    Wait Until Page Contains Element  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
    Click Element  css=[content-desc="More options"]
    Wait Until Page Contains Element  css=[text="About"]
    Click Element  css=[text="About"]
    Page Should Contain Text  Minimal
    Page Should Contain Text  Version: 1.2
    Page Should Contain Text  Made by Avjinder
    Page Should Contain Text  You can contact me at
    Page Should Contain Text  avisekhon@gmail.com
    Press Keycode  4


*** Keywords ***
Connect Android
     Log To Console  Open ToDo-List Application

Close Todo Application
    Sleep  5
    Close Application  

Page Should be not contain element Todo
    [Arguments]  ${location}
    @{els}=  Get Webelements  ${location}
    ${size}=  Get Length    ${els}
    Should Be True  ${size} < 2

Todo should allow duplicated name
    [Arguments]  ${location}
    @{els}=  Get Webelements  ${location}
    ${size}=  Get Length  ${els}
    Should Be True  ${size} > 1

Swipe Right to Left
    [Arguments]       ${fragement}
    wait until element is Visible     ${fragement}
    ${element_size}=    Get Element Size    ${fragement}
    ${element_location}=    Get Element Location    ${fragement}
    ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.8)
    ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
    ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.1)
    ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
    Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  3000
    Sleep  1