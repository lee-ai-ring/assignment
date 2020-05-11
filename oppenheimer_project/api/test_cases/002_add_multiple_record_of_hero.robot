*** Settings ***
Resource        ../variables/common_variables.robot
Resource        ../variables/common_messages.robot
Resource        ../keywords/002_add_multiple_record_of_hero_keyword.robot
#Test Setup      POST        ${main_url}${rake_database}
#Test Teardown   POST        ${main_url}${rake_database}

*** Test Cases ***
TC 1: Submit Single Hero Successfully
    [Template]    Add Multiple Record Of Hero Successfully
    [Tags]        submit_single_hero_successfully
    #${insert_hero_request_json}                                                    ${success_message}
    ./oppenheimer_project/api/request_json_files/single_hero_request.json           ${add_single_hero_successfully}

TC 2: Submit Multiple Heroes Successfully
    [Template]    Add Multiple Record Of Hero Successfully
    [Tags]        submit_multiple_heroes_successfully
    #${insert_hero_request_json}                                                    ${success_message}
    ./oppenheimer_project/api/request_json_files/multiple_heroes_request.json       ${add_single_hero_successfully}

