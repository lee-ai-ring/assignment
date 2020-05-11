*** Settings ***
Library             SeleniumLibrary
Resource        ../keywords/001_upload_csv_keyword.robot
Resource        ../keywords/002_dispense_amount_keyword.robot
Resource        ../pages/002_dispense_amount_page.robot

*** Keywords ***
Red "Dispense Now" Button Displayed
    "Dispense Now" Button Displayed
    Verify that "Dispense Now" Button Is Red Colour

Text On Button Display "Dispense Now"
    "Dispense Now" Button Displayed
    Verify Button Text Display "Dispense Now"

Click on "Dispense Now" Button
    "Dispense Now" Button Displayed
    Click "Dispense Now" Button

"Cash dispensed" Page Displayed
    Correct Link Displayed
    "Cash Dispensed" Displayed