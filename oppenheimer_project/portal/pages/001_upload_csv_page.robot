*** Settings ***
Library             SeleniumLibrary
Resource            ../variables/common_variables.robot
Resource            ../variables/common_messages.robot
Resource            ../keywords/001_upload_csv_keyword.robot
Resource            ../pages/001_upload_csv_page.robot

*** Variables ***
${page_header}      //h1[contains(text(),'The Oppenheimer Project')]
${browse_button}    //input[@class='custom-file-input']

*** Keywords ***
Landing Page displayed
    ${URL}=                             get location
    run keyword if                      '${URL}'!='${main_url}'     go to               ${main_url}
    wait until element is visible       ${page_header}              ${wait_time}

Upload File
    [Arguments]     ${file}
    wait until page contains element    ${browse_button}            ${wait_time}
    choose file                         ${browse_button}            ${file}

Upload Success Message Displayed
    [Arguments]     ${success_message}
    wait until page contains            ${success_message}          ${wait_time}

Failed CSV Upload Message Displayed
    [Arguments]     ${error}
    wait until page contains            ${error}                    ${wait_time}