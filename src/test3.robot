*** Settings ***
Library  RequestsLibrary

# Author: Aniwat Ruttanaudom

*** Test Cases ***
Get User Profile Success
    ${response_aniwat}=    GET  https://reqres.in/api/users/12
    Should Be Equal  '${response_aniwat.status_code}'  '200'
    Should Be Equal  '${response_aniwat.json()}[data][id]'  '12'
    Should Be Equal  '${response_aniwat.json()}[data][email]'  'rachel.howell@reqres.in'
    Should Be Equal  '${response_aniwat.json()}[data][first_name]'  'Rachel'
    Should Be Equal  '${response_aniwat.json()}[data][last_name]'  'Howell'
    Should Be Equal  '${response_aniwat.json()}[data][avatar]'  'https://reqres.in/img/faces/12-image.jpg'

Get user profile but user not found    
    ${response_aniwat}=    GET   https://reqres.in/api/users/1234  expected_status=404
    Should Be Equal  '${response_aniwat.status_code}'  '404'
    Should Be Equal  '${response_aniwat.json()}'  '{}'