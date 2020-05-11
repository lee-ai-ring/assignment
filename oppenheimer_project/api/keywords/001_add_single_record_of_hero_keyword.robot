*** Settings ***
Library                 REST                            ${main_url}

*** Keywords ***
Add Single Record Of Hero With Correct Values
    [Arguments]    ${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${success_message}
    ########## Insert Single Hero ##########
    POST                ${insert_single_hero}
    ...                 {"birthday": "${birthday}","gender": "${gender}","name": "${name}","natid": "${natid}","salary": "${salary}","tax": "${tax}"}
    Integer             response status                 202
    String              response body                   ${success_message}
    ########## Verify if the single hero is added successfully ##########
    GET                 ${view_tax_relief}
    String              response body 0 name            ${name}
    ########## Rake the record in DB ##########
    POST                ${rake_database}

Add Single Record Of Hero With Invalid Values
    [Arguments]    ${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${error}
    POST                ${insert_single_hero}
    ...                 {"birthday": "${birthday}","gender": "${gender}","name": "${name}","natid": "${natid}","salary": "${salary}","tax": "${tax}"}
    Integer             response status                 500
    String              response body message           ${error}

Add Single Record Of Hero With Missing Values
    [Arguments]    ${insert_single_hero_json}    ${error}
    POST                ${insert_single_hero}
    ...                 ${insert_single_hero_json}
    Integer             response status                 500
    String              response body message           ${error}







