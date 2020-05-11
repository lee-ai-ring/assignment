*** Settings ***
Library             SeleniumLibrary
Resource            ../variables/common_variables.robot
Resource            ../variables/common_messages.robot
Resource            ../pages/001_upload_csv_page.robot

*** Keywords ***
Upload CSV File Successfully
    [Arguments]     ${file}     ${success_message}
    GIVEN Go To Landing Page
    WHEN Upload CSV     ${file}
    THEN Uploaded CSV Successfully      ${success_message}

Failed To Upload CSV File
    [Arguments]     ${file}     ${error}
    GIVEN Go To Landing Page
    WHEN Upload CSV     ${file}
    THEN CSV Upload Failed      ${error}

#############################################################
#############################################################
#############################################################
#############################################################
#############################################################

Go To Landing Page
    Landing Page displayed

Upload CSV
    [Arguments]     ${file}
    Upload File     ${file}

Uploaded CSV Successfully
    [Arguments]     ${success_message}
    Upload Success Message Displayed        ${success_message}

CSV Upload Failed
    [Arguments]     ${error}
    Failed CSV Upload Message Displayed     ${error}



