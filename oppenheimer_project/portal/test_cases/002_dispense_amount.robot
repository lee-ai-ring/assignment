*** Settings ***
Resource        ../variables/common_variables.robot
Resource        ../variables/common_messages.robot
Resource        ../keywords/001_upload_csv_keyword.robot
Resource        ../keywords/002_dispense_amount_keyword.robot
Resource        ../pages/002_dispense_amount_page.robot

*** Test Cases ***
TC 1: "Dispense Now" Button Is Red Colour
    [Tags]        dispense_now_button_is_red_colour
    WHEN Go To Landing Page
    THEN Red "Dispense Now" Button Displayed

TC 2: Text On The Button Is "Dispense Now"
    [Tags]        text_on_the_button_is_dispense_now
    WHEN Go To Landing Page
    THEN Text On Button Display "Dispense Now"

TC 3: Text On The Button Is "Dispense Now"
    [Tags]        text_on_the_button_is_dispense_now
    GIVEN Go To Landing Page
    WHEN Click on "Dispense Now" Button
    THEN "Cash dispensed" Page Displayed

