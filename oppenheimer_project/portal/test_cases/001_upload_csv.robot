*** Settings ***
Resource        ../variables/common_variables.robot
Resource        ../variables/common_messages.robot
Resource        ../keywords/001_upload_csv_keyword.robot
Resource        ../pages/001_upload_csv_page.robot
#Test Setup      POST        ${main_url}${rake_database}
#Test Teardown   POST        ${main_url}${rake_database}

*** Test Cases ***
TC 1: Upload Valid CSV File
    [Template]    Upload CSV File Successfully
    [Tags]        upload_valid_csv_file
    #${file}                                                                                    ${success_message}
    /Users/airing/projects/oppenheimer_project/portal/upload_csv_files/valid_csv.csv            CSV uploaded successfully.

TC 2: Upload Invalid File Type
    [Template]    Failed To Upload CSV File
    [Tags]        upload_invalid_file_type
    #${file}                                                                                    ${error}
    ${upload_csv_folder}/PDF.pdf                                                                This file type is not supported. Allowed file type: .csv
    ${upload_csv_folder}/greenery.jpg                                                           This file type is not supported. Allowed file type: .csv
    ${upload_csv_folder}/small-png-images-3.png                                                 This file type is not supported. Allowed file type: .csv
    ${upload_csv_folder}/astronaut.jpeg                                                         This file type is not supported. Allowed file type: .csv
    ${upload_csv_folder}/file-sample_1MB.docx                                                   This file type is not supported. Allowed file type: .csv
    ${upload_csv_folder}/file-sample_1MB.doc                                                    This file type is not supported. Allowed file type: .csv
    ${upload_csv_folder}/file_example_XLSX_5000.xlsx                                            This file type is not supported. Allowed file type: .csv
    ${upload_csv_folder}/file_example_XLS_5000.xls                                              This file type is not supported. Allowed file type: .csv

TC 3: File Name Contain Unicode Character
    [Template]    Failed To Upload CSV File
    [Tags]        file_name_contain_unicode_character
    #${file}                                                                                    ${error}
    ${upload_csv_folder}/여보세요.csv                                                             Invalid file name.

TC 4: Exceeded File Size Limit
    [Template]    Failed To Upload CSV File
    [Tags]        exceeded_file_size_limit
    #${file}                                                                                    ${error}
    ${upload_csv_folder}/incorrect_values.csv                                                   Exceeded 2MB file size limit.

