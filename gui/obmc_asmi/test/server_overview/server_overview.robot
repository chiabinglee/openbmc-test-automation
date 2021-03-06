*** Settings ***
Documentation  This test suite will validate the "OpenBMC ASMI Menu ->
...            Server Overview" module.

Resource         ../../lib/resource.robot
Test Setup       OpenBMC Test Setup
Test Teardown    OpenBMC Test Closure

*** Variables ***
${xpath_select_overview_1}  //*[@id="nav__top-level"]/li[1]/a/span
${xpath_select_overview_2}  //a[@href='#/overview/system']
${string_display_content}   Server overview

*** Test Case ***
Verify Title Text Content
    [Documentation]  Verify display of title text from "Server Overview"
    ...              module of OpenBMC GUI.
    [Tags]  Verify_Title_Text_Content
    Verify Display Content

*** Keywords ***
Verify Display Content
    [Documentation]  Verify displaying of text.
    Click Button  ${xpath_select_overview_1}
    Click Button  ${xpath_select_overview_2}
    Page Should Contain  ${string_display_content}
