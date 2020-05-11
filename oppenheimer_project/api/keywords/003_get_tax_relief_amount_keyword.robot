*** Settings ***
Library         REST                            ${main_url}

*** Keywords ***
Masked NatID
    [Arguments]    ${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}   ${masked_natid}
    POST                ${insert_single_hero}
    ...                 {"birthday": "${birthday}","gender": "${gender}","name": "${name}","natid": "${natid}","salary": "${salary}","tax": "${tax}"}
    GET                 ${view_tax_relief}
    String              response body 0 natid            ${masked_natid}
    ########## Rake the record in DB ##########
    POST                ${rake_database}

Tax Relief Calculation
    [Arguments]    ${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}   ${masked_natid}     ${tax_relief}
    POST                ${insert_single_hero}
    ...                 {"birthday": "${birthday}","gender": "${gender}","name": "${name}","natid": "${natid}","salary": "${salary}","tax": "${tax}"}
    GET                 ${view_tax_relief}
    String              response body 0 natid            ${masked_natid}
    String              response body 0 name             ${name}
    String              response body 0 relief           ${tax_relief}
    ########## Rake the record in DB ##########
    POST                ${rake_database}








