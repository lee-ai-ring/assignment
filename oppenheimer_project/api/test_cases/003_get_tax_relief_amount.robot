*** Settings ***
Library         DateTime
Resource        ../variables/common_variables.robot
Resource        ../variables/common_messages.robot
Resource        ../keywords/003_get_tax_relief_amount_keyword.robot
Test Setup      POST        ${main_url}${rake_database}
Test Teardown   POST        ${main_url}${rake_database}

*** Test Cases ***
TC 1: NatID Must Be Masked From The Fifth Character
    [Template]    Masked NatID
    [Tags]        natid_must_be_masked_from_the_fifth_character
    #${birthday}    ${gender}    ${name}        ${natid}                    ${salary}       ${tax}      ${masked_natid}
    12121991        M            Jung Kook      1234                        1999.99         12          1234
    12121991        M            Jung Kook      12345                       1999.99         12          1234$
    12121991        M            Jung Kook      12345678901234567890        1999.99         12          1234$$$$$$$$$$$$$$$$

TC 2: Age Is 0 And Gender is Male
    [Template]    Tax Relief Calculation
    [Tags]        age_is_0_and_gender_is_male
    #${birthday}    ${gender}    ${name}        ${natid}    ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    12122020        M            Jung Kook      ABC123      1999            100         ABC1$$              1899.00

TC 3: Age Is 18 And Gender is Female
    [Template]    Tax Relief Calculation
    [Tags]        age_is_18_and_gender_is_female
    #${birthday}    ${gender}    ${name}        ${natid}        ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01012002        F            Tae Yeon       S1234567890H    3500            189         S123$$$$$$$$        3811.00

TC 4: Age Is 19 And Gender is Male
    [Template]    Tax Relief Calculation
    [Tags]        age_is_19_and_gender_is_male
    #${birthday}    ${gender}    ${name}        ${natid}    ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01012001        M            Jung Kook      ABC123      8000            500         ABC1$$              6000.00

TC 5: Age Is 35 And Gender is Female
    [Template]    Tax Relief Calculation
    [Tags]        age_is_35_and_gender_is_female
    #${birthday}    ${gender}    ${name}        ${natid}        ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01011985        F            Tae Yeon       S1234567890H    90000           5500        S123$$$$$$$$        68100.00

TC 6: Age Is 36 And Gender is Male
    [Template]    Tax Relief Calculation
    [Tags]        age_is_36_and_gender_is_male
    #${birthday}    ${gender}    ${name}        ${natid}    ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01011984        M            Jung Kook      ABC123      8000            500         ABC1$$              3750.00

TC 7: Age Is 50 And Gender is Female
    [Template]    Tax Relief Calculation
    [Tags]        age_is_50_and_gender_is_female
    #${birthday}    ${gender}    ${name}        ${natid}        ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01011970        F            Tae Yeon       S1234567890H    90000           5500        S123$$$$$$$$        42750.00

TC 8: Age Is 51 And Gender is Male
    [Template]    Tax Relief Calculation
    [Tags]        age_is_51_and_gender_is_male
    #${birthday}    ${gender}    ${name}        ${natid}    ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01011969        M            Jung Kook      ABC123      10500           500         ABC1$$              3670.00

TC 9: Age Is 75 And Gender is Female
    [Template]    Tax Relief Calculation
    [Tags]        age_is_75_and_gender_is_female
    #${birthday}    ${gender}    ${name}        ${natid}        ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01011945        F            Tae Yeon       S1234567890H    10500           500         S123$$$$$$$$        4170.00

TC 10: Age Is 76 And Gender is Male
    [Template]    Tax Relief Calculation
    [Tags]        age_is_76_and_gender_is_male
    #${birthday}    ${gender}    ${name}        ${natid}    ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01011944        M            Jung Kook      ABC123      8000            500         ABC1$$              375.00

TC 11: Age Is 100 And Gender is Female
    [Template]    Tax Relief Calculation
    [Tags]        age_is_100_and_gender_is_female
    #${birthday}    ${gender}    ${name}        ${natid}        ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01011920        F            Tae Yeon       S1234567890H    90000           5500        S123$$$$$$$$        4725.00

TC 12: Normal Rounding Rule After Calculating Tax Relief Amount When Actual Value Is 1399.99
    [Template]    Tax Relief Calculation
    [Tags]        normal_rounding_rule_after_calculating_tax_relief_amount_1
    #${birthday}    ${gender}    ${name}        ${natid}    ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01011980        F            Jung Kook      ABC123      3799.98         2000        ABC1$$              1400.00        #Actual Value = 1399.99

TC 13: Normal Rounding Rule After Calculating Tax Relief Amount When Actual Value Is 600.01
    [Template]    Tax Relief Calculation
    [Tags]        normal_rounding_rule_after_calculating_tax_relief_amount_2
    #${birthday}    ${gender}    ${name}        ${natid}    ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01011980        F            Jung Kook      ABC123      500.04          300.02      ABC1$$              600.00         #Actual Value = 600.01

TC 14: Normal Rounding Rule After Calculating Tax Relief Amount When Actual Value Is 10000.49
    [Template]    Tax Relief Calculation
    [Tags]        normal_rounding_rule_after_calculating_tax_relief_amount_1
    #${birthday}    ${gender}    ${name}        ${natid}    ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01011980        M            Jung Kook      ABC123      30000           9999.02     ABC1$$              10000.00       #Actual Value = 10000.49

TC 15: Normal Rounding Rule After Calculating Tax Relief Amount When Actual Value Is 2752.50
    [Template]    Tax Relief Calculation
    [Tags]        normal_rounding_rule_after_calculating_tax_relief_amount_1
    #${birthday}    ${gender}    ${name}        ${natid}    ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01011965        M            Jung Kook      ABC123      8000            500         ABC1$$              2753.00        #Actual Value = 2752.50

TC 16: Calculated Tax Relief Amount Is -0.99
    [Template]    Tax Relief Calculation
    [Tags]        calculated_tax_relief_amount_1
    #For this scenario, you can either have a validation to NOT allow ${tax} >= ${salary}
    #or if calculated tax relief amount is < 50.00 then the final tax relief amount should be 50.00
    #${birthday}    ${gender}    ${name}        ${natid}    ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01011980        M            Jung Kook      ABC123      498.02          500         ABC1$$              50.00          #Actual Value = -0.99

TC 17: Calculated Tax Relief Amount Is 0.00
    [Template]    Tax Relief Calculation
    [Tags]        calculated_tax_relief_amount_2
    #${birthday}    ${gender}    ${name}        ${natid}    ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01012004        M            Jung Kook      ABC123      100             100         ABC1$$              50.00          #Actual Value = 0.00

TC 18: Calculated Tax Relief Amount Is 49.99
    [Template]    Tax Relief Calculation
    [Tags]        calculated_tax_relief_amount_3
    #${birthday}    ${gender}    ${name}        ${natid}    ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01011975        M            Jung Kook      ABC123      2099.98         2000        ABC1$$              50.00          #Actual Value = 49.99

TC 19: Calculated Tax Relief Amount Is 50.00
    [Template]    Tax Relief Calculation
    [Tags]        calculated_tax_relief_amount_4
    #${birthday}    ${gender}    ${name}        ${natid}    ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01011975        M            Jung Kook      ABC123      2000            1900        ABC1$$              50.00          #Actual Value = 50.00

TC 20: Calculated Tax Relief Amount Is 51.00
    [Template]    Tax Relief Calculation
    [Tags]        calculated_tax_relief_amount_5
    #${birthday}    ${gender}    ${name}        ${natid}    ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01011975        M            Jung Kook      ABC123      2002            1900        ABC1$$              51.00          #Actual Value = 51.00

TC 21: Tax Relief Amount Before Normal Rounding Rule Is 1000.495
    [Template]    Tax Relief Calculation
    [Tags]        tax_relief_amount_before_normal_rounding_rule_1
    #For this scenario, you can either have a validation to NOT allow ${tax} > ${salary}
    #or if calculated tax relief amount is < 50.00 then the final tax relief amount should be 50.00
    #${birthday}    ${gender}    ${name}        ${natid}    ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01011975        M            Jung Kook      ABC123      3000.99         1000        ABC1$$              1000.00        #Actual Value = 1000.495

TC 22: Tax Relief Amount Before Normal Rounding Rule Is 1000.494
    [Template]    Tax Relief Calculation
    [Tags]        tax_relief_amount_before_normal_rounding_rule_1
    #For this scenario, you can either have a validation to NOT allow ${tax} > ${salary}
    #or if calculated tax relief amount is < 50.00 then the final tax relief amount should be 50.00
    #${birthday}    ${gender}    ${name}        ${natid}    ${salary}       ${tax}      ${masked_natid}     ${tax_relief}
    01011975        M            Jung Kook      ABC123      3000.988        1000        ABC1$$              1000.00        #Actual Value = 1000.494

