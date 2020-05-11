*** Settings ***
Library         REST                            ${main_url}
Library         OperatingSystem

*** Keywords ***
Add Multiple Record Of Hero Successfully
    [Arguments]   ${insert_hero_request_json}       ${success_message}
    ${multiple_heroes}=         get binary file                 ${insert_hero_request_json}
    POST                        ${insert_multiple_heroes}
    ...                         ${multiple_heroes}
    Integer                     response status                 202
    String                      response body                   ${success_message}
    ########## Rake the record in DB ##########
    POST                        ${rake_database}








