*** Settings ***
#Library         OperatingSystem
#Library         String
#Library         JSONLibrary
Resource        ../variables/common_variables.robot
Resource        ../variables/common_messages.robot
Resource        ../keywords/001_add_single_record_of_hero_keyword.robot
Test Setup      POST        ${main_url}${rake_database}
Test Teardown   POST        ${main_url}${rake_database}


*** Test Cases ***
TC 1: Valid Birthday
    [Template]    Add Single Record Of Hero With Correct Values
    [Tags]        valid_birthday
    #${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${success_message}
    31121990        F            Fiona      123456789   1000         10        ${add_single_hero_successfully}
    31021990        F            Fiona      123456789   1000         10        ${add_single_hero_successfully}

TC 2: Birthday is empty
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        birthday_is_empty
    #${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}     ${error}
    ${empty}        F            Fiona      123456789   1000         10         Please enter Birthday (eg. 31121991).

TC 3: Birthday DD is more than 31
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        birthday_dd_is_more_than_31
    #${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${error}
    32021991        F            Fiona      123456789   1000         10        Day should be between 1 - 31.

TC 4: Birthday DD is less than 1
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        birthday_dd_is_less_than_1
    #${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${error}
    00121991        F            Fiona      123456789   1000         10        Day should be between 1 - 31.

TC 5: Birthday MM is more than 12
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        birthday_mm_is_more_than_12
    #${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${error}
    31131991        F            Fiona      123456789   1000         10        Month should be between 1 - 12.

TC 6: Birthday MM is less than 1
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        birthday_mm_is_less_than_1
    #${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${error}
    11001991        F            Fiona      123456789   1000         10        Month should be between 1 - 12.

TC 7: Birthday YYYY is more than current year
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        birthday_yyyy_is_more_than_current_year
    #${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${error}
    31128888        F            Fiona      123456789   1000         10        Year should be between 0001 - 9999.

TC 8: Birthday YYYY is less than 1
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        birthday_yyyy_is_less_than_1
    #${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${error}
    11120000        F            Fiona      123456789   1000         10        Year should be between 0001 - 9999.

TC 9: Birthday DD contain alphabet
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        birthday_dd_contain_alphabet
    #${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${error}
    1a121991        F            Fiona      123456789   1000         10        Please enter valid characters in the format of DDMMYYY (eg. 31121991).

TC 10: Birthday MM contain alphabet
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        birthday_mm_contain_alphabet
    #${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${error}
    12b31991        F            Fiona      123456789   1000         10        Please enter valid characters in the format of DDMMYYY (eg. 31121991).

TC 11: Birthday YYYY contain alphabet
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        birthday_yyyy_contain_alphabet
    #${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${error}
    12121r91        F            Fiona      123456789   1000         10        Please enter valid characters in the format of DDMMYYY (eg. 31121991).

TC 12: Birthday DD contain special character
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        birthday_dd_contain_special_character
    #${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${error}
    1.121991        F            Fiona      123456789   1000         10        Please enter valid characters in the format of DDMMYYY (eg. 31121991).

TC 13: Birthday MM contain special character
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        birthday_mm_contain_special_character
    #${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${error}
    121/1991        F            Fiona      123456789   1000         10        Please enter valid characters in the format of DDMMYYY (eg. 31121991).

TC 14: Birthday YYYY contain special character
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        birthday_yyyy_contain_special_character
    #${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${error}
    12121#91        F            Fiona      123456789   1000         10        Please enter valid characters in the format of DDMMYYY (eg. 31121991).

TC 15: Birthday contain incorrect format
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        birthday_contain_incorrect_format
    #${birthday}            ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${error}
    12/12/1991              F            Fiona      123456789   1000         10        Please enter valid characters in the format of DDMMYYY (eg. 31121991).
    12-12-1991              F            Fiona      123456789   1000         10        Please enter valid characters in the format of DDMMYYY (eg. 31121991).
    12:12:1991              F            Fiona      123456789   1000         10        Please enter valid characters in the format of DDMMYYY (eg. 31121991).
    12th December 1991      F            Fiona      123456789   1000         10        Please enter valid characters in the format of DDMMYYY (eg. 31121991).
    12Dec1991               F            Fiona      123456789   1000         10        Please enter valid characters in the format of DDMMYYY (eg. 31121991).
    ${space}12121991        F            Fiona      123456789   1000         10        Please enter valid characters in the format of DDMMYYY (eg. 31121991).
    中国深圳                 F            Fiona      123456789   1000         10        Please enter valid characters in the format of DDMMYYY (eg. 31121991).
    กรุงเทพ                  F            Fiona      123456789   1000         10        Please enter valid characters in the format of DDMMYYY (eg. 31121991).
    천담동                    F            Fiona      123456789   1000         10        Please enter valid characters in the format of DDMMYYY (eg. 31121991).

TC 16: Valid Gender
    [Template]    Add Single Record Of Hero With Correct Values
    [Tags]        valid_gender
    #${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${success_message}
    18121990        F            Fiona      123456789   1000         10        ${add_single_hero_successfully}
    18121990        m            Jason      123456789   1000         10        ${add_single_hero_successfully}

TC 17: Gender is empty
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        gender_is_empty
    #${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${error}
    12121991        ${empty}     Fiona      123456789   1000         10        Please enter Gender (eg. F or M).

TC 18: Gender contain number
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        gender_contain_number
    #${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${error}
    12121991        0            Fiona      123456789   1000         10        Please enter valid characters (eg. F or M).

TC 19: Gender contain special character
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        gender_contain_special_character
    #${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${error}
    12121991        .            Fiona      123456789   1000         10        Please enter valid characters (eg. F or M).

TC 20: Gender contain incorrect value
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        gender_is_incorrect_value
    #${birthday}    ${gender}    ${name}    ${natid}    ${salary}    ${tax}    ${error}
    12121991        female       Fiona      123456789   1000         10        Please enter Gender in the correct format (eg. F or M).
    12121991        MALE         Jason      123456789   1000         10        Please enter Gender in the correct format (eg. F or M).
    12121991        ${space}     Jason      123456789   1000         10        Please enter valid characters (eg. F or M).
    12121991        中国深圳      Jason      123456789   1000         10        Please enter valid characters (eg. F or M).
    12121991        กรุงเทพ       Jason      123456789   1000         10        Please enter valid characters (eg. F or M).
    12121991        천담동         Jason      123456789   1000         10        Please enter valid characters (eg. F or M).

TC 21: Valid Name
    [Template]    Add Single Record Of Hero With Correct Values
    [Tags]        valid_name
    #${birthday}    ${gender}    ${name}                ${natid}    ${salary}    ${tax}    ${success_message}
    18121990        F            Sheela d/o Ramlee      123456789   1000         10        ${add_single_hero_successfully}
    18121990        m            gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR2gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR2gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR2gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR2gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR2                  123456789   1000         10        ${add_single_hero_successfully}
    18121990        m            Jeon Jung Kook         123456789   1000         10        ${add_single_hero_successfully}

TC 22: Name is empty
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        name_is_empty
    #${birthday}    ${gender}    ${name}        ${natid}    ${salary}    ${tax}    ${error}
    12121991        f            ${empty}       123456789   1000         10        Please enter Name (eg. Bryan).

TC 23: Name has exceeded char length limit
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        name_has_exceeded_char_length_limit
    #${birthday}    ${gender}    ${name}                                                                                                                                                                                                                                                                ${natid}    ${salary}    ${tax}    ${error}
    12121991        f            gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR2gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR2gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR2gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR2gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR21       123456789   1000         10        You have exceeded 255 char length limit.

TC 24: Name contain number
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        name_contain_number
    #${birthday}    ${gender}    ${name}        ${natid}    ${salary}    ${tax}    ${error}
    12121991        M            1234567890     123456789   1000         10        Please enter valid characters (eg. Bryan).

TC 25: Name contain special character
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        name_contain_special_character
    #${birthday}    ${gender}    ${name}                ${natid}    ${salary}    ${tax}    ${error}
    12121991        M            ~!@#$%^&*()_+=-        123456789   1000         10        Please enter valid characters (eg. Bryan).

TC 26: Name contain incorrect value
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        name_is_incorrect_value
    #${birthday}    ${gender}    ${name}                ${natid}    ${salary}    ${tax}    ${error}
    12121991        M            中国深圳                123456789   1000         10        Please enter valid characters (eg. Bryan).
    12121991        M            กรุงเทพ                 123456789   1000         10        Please enter valid characters (eg. Bryan).
    12121991        M            천담동                   123456789   1000         10        Please enter valid characters (eg. Bryan).
    12121991        M            ${space}Jung Kook      123456789   1000         10        Please enter valid characters (eg. Bryan).

TC 27: Valid Natural ID
    [Template]    Add Single Record Of Hero With Correct Values
    [Tags]        valid_natural_id
    #${birthday}    ${gender}    ${name}                ${natid}            ${salary}    ${tax}    ${success_message}
    18121990        m            Jeon Jung Kook         S123456789H         1000         10        ${add_single_hero_successfully}
    18121990        m            Jeon Jung Kook         abc12345678         1000         10        ${add_single_hero_successfully}
    18121990        m            Jeon Jung Kook         1234                1000         10        ${add_single_hero_successfully}
    18121990        m            Jeon Jung Kook         gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR2gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR2gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR2gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR2gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR2         1000         10        ${add_single_hero_successfully}

TC 28: Natural ID is empty
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        natural_id_is_empty
    #${birthday}    ${gender}    ${name}        ${natid}    ${salary}    ${tax}    ${error}
    12121991        m            Jung Kook      ${empty}    1000         10        Please enter Natural ID (eg. S123456789H).

TC 29: Natural ID has exceeded char length limit
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        natural_id_has_exceeded_char_length_limit
    #${birthday}    ${gender}    ${name}        ${natid}                                                                                                                                                                                                                                                            ${salary}    ${tax}    ${error}
    12121991        f            Jung Kook      gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR2gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR2gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR2gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR2gBPijvzUHDL6IxNH6Ertmh9mP4MTEryomiSkT0rWrRpVISU7VR21    1000         10        You have exceeded 255 char length limit.

TC 30: Natural ID contain special character
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        natural_id_contain_special_character
    #${birthday}    ${gender}    ${name}                ${natid}            ${salary}    ${tax}    ${error}
    12121991        M            Jung Kook              123-456-789         1000         10        Please enter valid characters (eg. S123456789H).
    12121991        M            Jung Kook              !@#$%^&*())_+-=     1000         10        Please enter valid characters (eg. S123456789H).

TC 31: Natural ID contain incorrect value
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        natural_id_is_incorrect_value
    #${birthday}    ${gender}    ${name}        ${natid}        ${salary}    ${tax}    ${error}
    12121991        M            Jung Kook      ${space}123     1000         10        Please enter valid characters (eg. S123456789H).
    12121991        M            Jung Kook      123             1000         10        Please enter at least 4 characters.
    12121991        M            Jung Kook      23456789        1000         10        Please enter valid characters (eg. S123456789H).
    12121991        M            Jung Kook      中国深圳         1000         10        Please enter valid characters (eg. S123456789H).
    12121991        M            Jung Kook      กรุงเทพ          1000         10        Please enter valid characters (eg. S123456789H).
    12121991        M            Jung Kook      천담동            1000         10        Please enter valid characters (eg. S123456789H).

TC 32: Valid Salary
    [Template]    Add Single Record Of Hero With Correct Values
    [Tags]        valid_salary
    #${birthday}    ${gender}    ${name}                ${natid}            ${salary}           ${tax}    ${success_message}
    18121990        m            Jeon Jung Kook         S123456789H         999999999.99        10        ${add_single_hero_successfully}
    18121990        m            Jeon Jung Kook         S123456789H         0                   10        ${add_single_hero_successfully}
    18121990        m            Jeon Jung Kook         S123456789H         1999.915            10        ${add_single_hero_successfully}

TC 33: Salary is empty
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        salary_is_empty
    #${birthday}    ${gender}    ${name}        ${natid}        ${salary}    ${tax}    ${error}
    12121991        m            Jung Kook      S123456789H     ${empty}     10        Please enter Salary (eg. 3500.99).

TC 34: Salary has exceeded char length limit
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        salary_has_exceeded_char_length_limit
    #${birthday}    ${gender}    ${name}        ${natid}        ${salary}           ${tax}    ${error}
    12121991        f            Jung Kook      S123456789H     1000000000.00       10        Maximum is 999999999.99

TC 35: Salary contain alphabet
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        salary_contain_alphabet
    #${birthday}    ${gender}    ${name}        ${natid}        ${salary}    ${tax}    ${error}
    12121991        M            Jung Kook      S123456789H     abc          10        Please enter valid characters (eg. 3500.99).

TC 36: Salary contain special character
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        salary_contain_special_character
    #${birthday}    ${gender}    ${name}        ${natid}        ${salary}           ${tax}    ${error}
    12121991        M            Jung Kook      S123456789H     !@#$%^&*()_+=-      10        Please enter valid characters (eg. 3500.99).

TC 37: Salary contain incorrect value
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        salary_is_incorrect_value
    #${birthday}    ${gender}    ${name}        ${natid}        ${salary}       ${tax}    ${error}
    12121991        M            Jung Kook      S123456789H     中国深圳         10        Please enter valid characters (eg. 3500.99).
    12121991        M            Jung Kook      S123456789H     กรุงเทพ          10        Please enter valid characters (eg. 3500.99).
    12121991        M            Jung Kook      S123456789H     천담동            10        Please enter valid characters (eg. 3500.99).
    12121991        M            Jung Kook      S123456789H     ${space}3500    10        Please enter valid characters (eg. 3500.99).
    12121991        M            Jung Kook      S123456789H     -1              10        Minimum is 0.

TC 38: Valid Tax
    [Template]    Add Single Record Of Hero With Correct Values
    [Tags]        valid_tax
    #${birthday}    ${gender}    ${name}                ${natid}            ${salary}           ${tax}          ${success_message}
    18121990        m            Jeon Jung Kook         S123456789H         999999999.99        999999999.99    ${add_single_hero_successfully}
    18121990        m            Jeon Jung Kook         S123456789H         0                   0               ${add_single_hero_successfully}
    18121990        m            Jeon Jung Kook         S123456789H         1999.915            1999.915        ${add_single_hero_successfully}

TC 39: Tax is empty
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        tax_is_empty
    #${birthday}    ${gender}    ${name}        ${natid}        ${salary}    ${tax}         ${error}
    12121991        m            Jung Kook      S123456789H     1999.99      ${empty}       Please enter Tax (eg. 3500.99).

TC 40: Tax has exceeded char length limit
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        tax_has_exceeded_char_length_limit
    #${birthday}    ${gender}    ${name}        ${natid}        ${salary}           ${tax}              ${error}
    12121991        f            Jung Kook      S123456789H     1000000000.00       1000000000.00       Maximum is 999999999.99

TC 41: Tax contain alphabet
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        tax_contain_alphabet
    #${birthday}    ${gender}    ${name}        ${natid}        ${salary}    ${tax}    ${error}
    12121991        M            Jung Kook      S123456789H     1999.99      abc       Please enter valid characters (eg. 3500.99).

TC 42: Tax contain special character
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        tax_contain_special_character
    #${birthday}    ${gender}    ${name}        ${natid}        ${salary}   ${tax}              ${error}
    12121991        M            Jung Kook      S123456789H     1999.99     !@#$%^&*()_+=-      Please enter valid characters (eg. 3500.99).

TC 43: Tax contain incorrect value
    [Template]    Add Single Record Of Hero With Invalid Values
    [Tags]        tax_is_incorrect_value
    #${birthday}    ${gender}    ${name}        ${natid}        ${salary}       ${tax}             ${error}
    12121991        M            Jung Kook      S123456789H     1999.99         中国深圳            Please enter valid characters (eg. 3500.99).
    12121991        M            Jung Kook      S123456789H     1999.99         กรุงเทพ             Please enter valid characters (eg. 3500.99).
    12121991        M            Jung Kook      S123456789H     1999.99         천담동               Please enter valid characters (eg. 3500.99).
    12121991        M            Jung Kook      S123456789H     1999.99         ${space}3500       Please enter valid characters (eg. 3500.99).
    12121991        M            Jung Kook      S123456789H     1999.99         -1                 Minimum is 0.

TC 44: Add Single Record of Hero With Missing Values
    [Template]    Add Single Record Of Hero With Missing Values
    [Tags]        add_single_record_of_hero_with_missing_values
    #${insert_single_hero_json}
    {"gender": "F","name": "Jennie","natid": "A12345","salary": "1234","tax": "88"}                 Birthday is missing.
    {"birthday": "12121990","name": "Jennie","natid": "A12345","salary": "1234","tax": "88"}        Gender is missing.
    {"birthday": "12121990","gender": "F","natid": "A12345","salary": "1234","tax": "88"}           Name is missing.
    {"birthday": "12121990","gender": "F","name": "Jennie","salary": "1234","tax": "88"}            Natural ID is missing.
    {"birthday": "12121990","gender": "F","name": "Jennie","natid": "A12345","tax": "88"}           Salary is missing.
    {"birthday": "12121990","gender": "F","name": "Jennie","natid": "A12345","salary": "1234"}      Tax is missing.

