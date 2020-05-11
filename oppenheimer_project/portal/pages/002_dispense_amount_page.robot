*** Settings ***
Library                     SeleniumLibrary
Resource                    ../variables/common_variables.robot
Resource                    ../variables/common_messages.robot
Resource                    ../keywords/001_upload_csv_keyword.robot
Resource                    ../keywords/002_dispense_amount_keyword.robot
Resource                    ../pages/002_dispense_amount_page.robot

*** Variables ***
${dispense_now_button}      //a[@class='btn btn-danger btn-block']
${cash_dispense_text}       //div[@class='display-4 font-weight-bold']

*** Keywords ***
"Dispense Now" Button Displayed
    scroll element into view                ${dispense_now_button}
    wait until element is visible           ${dispense_now_button}              ${wait_time}

Verify that "Dispense Now" Button Is Red Colour
    sleep                                   ${sleep_time}
    ${background_color}=                    execute javascript                  return window.getComputedStyle(document.getElementsByClassName("btn btn-danger btn-block")[0]).getPropertyValue('background-color');
    should be equal                         ${background_color}                 rgb(220, 53, 69)        #colour code = #dc3545

Verify Button Text Display "Dispense Now"
    element text should be                  ${dispense_now_button}              Dispense Now

Click "Dispense Now" Button
    click element                           ${dispense_now_button}

Correct Link Displayed
    ${URL}=                                 get location
    should be equal                         ${URL}                              ${main_url}${cash_dispensed_url}

"Cash Dispensed" Displayed
    element text should be                  ${cash_dispense_text}               Cash dispensed

