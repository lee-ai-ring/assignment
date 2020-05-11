*** Settings ***
Library             SeleniumLibrary
Resource            ./variables/common_variables.robot
Suite Setup         Suite Setup
Suite Teardown      Suite Teardown

*** Keywords ***
Suite Setup
    [Tags]  suite_setup
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # Comment off "window-size\=1440,810", "headless" and un-comment "Maximize Browser Window" to run chrome and vice versa
    #Call Method         ${chrome_options}       add_argument            headless
    #Call Method         ${chrome_options}       add_argument            --window-size\=1440,810
    Call Method         ${chrome_options}       add_argument            --disable-extensions
    Call Method         ${chrome_options}       add_argument            --no-sandbox
    Call Method         ${chrome_options}       add_argument            disable-gpu
    ${options}=         Call Method             ${chrome_options}       to_capabilities
    Open Browser        ${main_url}             browser=chrome          remote_url=False                desired_capabilities=${options}
    Maximize Browser Window

Suite Teardown
    [Tags]  suite_teardown
    close browser
