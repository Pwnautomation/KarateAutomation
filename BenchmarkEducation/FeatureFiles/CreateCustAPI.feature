Feature: Crate book customization


@CreateCust1
Scenario: Create customization thru API
  Given url 'https://supervisor-staging.benchmarkuniverse.com/presentations/create?sid=9d83403060582261d41e0a208aea96550e9a436b'
  Then form field name = "Cust from karate"
  And form field vCode = "X04368"
  And form field locked = "false"
  Then method post
  And status 200
* print response


@CreateNoCust
Scenario: Create n no of customization 
* def repeatRun = function() {return karate.call('Apitest.feature@CreateCust')}
* def noofcust = karate.repeat(40 , repeatRun)
* print noofcust