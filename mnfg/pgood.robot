*** Settings ***

Documentation  This test suite verifies pgood state.

Resource  ../lib/rest_client.robot
Resource  ../lib/utils.robot
Resource  ../lib/state_manager.robot

Variables  ../data/variables.py

*** Variables ***

${POWER_URI}  ${CONTROL_URI}/power0/

*** Test Cases ***

Verify PGood When Power On Using REST
    [Documentation]  Verify pgood state on good power supply.
    [Tags]  Verify_PGood_When_Power_On_Using_REST

    # Initiate Host poweron using rest commands.
    Initiate Host Boot  1
    ${data}=  Read Attribute  ${POWER_URI}  pgood

    Should Be Equal As Integers  ${data}  1

Verify PGood When Power Off Using REST
    [Documentation]  Verify pgood state on bad power supply.
    [Tags]  Verify_PGood_When_Power_Off_Using_REST

    # Initiate Host poweroff using rest commands.
    Initiate Host PowerOff  1
    ${data}=  Read Attribute  ${POWER_URI}  pgood

    Should Be Equal As Integers  ${data}  0
