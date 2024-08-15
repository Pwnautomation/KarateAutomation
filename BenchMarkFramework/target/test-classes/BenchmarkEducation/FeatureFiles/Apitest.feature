Feature:API testing for practice
  Background: Set url
  

    @API1  
  Scenario: get the details
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And print response


    @API2
  Scenario: create airline with hardcoded JSON paylod
    Given url 'https://api.instantwebtools.net/v1/airlines'
    And request 
    """
    {
    "_id":"252d3bca-d9bb-476c-9a97-568766",
    "name": "Sri Lankan Airways",
    "country": "Sri Lanka",
    "logo": "https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Qatar_Airways_Logo.svg/sri_lanka.png",
    "slogan": "From Sri Lanka",
    "head_quaters": "Katunayake, Sri Lanka",
    "website": "www.srilankaaairways.com",
    "established": "1990"
    }
    """
    When method post
    Then status 200
    And print response
    And match responseStatus == 200


    @API4
  Scenario: create airline with hardcoded created paylod
    Given url 'https://api.instantwebtools.net/v1/airlines'
    * def requestPayload = {}
    * requestPayload.id = 234567
    * requestPayload.name = "Test Airline"
    * requestPayload.countary = "India"
    * requestPayload.logo = "https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Qatar_Airways_Logo.svg/sri_lanka.png"
    * requestPayload.slogan = "From Sri Lanka"
    * requestPayload.head_quaters = "Katunayake, Sri Lanka"
    * requestPayload.website= "www.srilankaaairways.com"
    * requestPayload.established = "1990"
    And request requestPayload
    When method post
    Then status 200
    And print requestPayload
    And print response
    And match responseStatus == 200



    @API5
  Scenario: create an airline with payload from JSON file

    Given url 'https://api.instantwebtools.net/v1/airlines'
    * def requestPayload = read ('classpath:BenchmarkEducation/creatairlinepayload.json')
    * set requestPayload._id = "6789tyu7554hhh"
    And print requestPayload
    And request requestPayload
    When method post
    Then match responseStatus == 200
    And print response



    @API6
  Scenario Outline: read csv file <name> , <age>
    * def jsondoc = { name_: '#(name)' , age_:'#(age)'}

    * print jsondoc

    Examples:
      |read('data.csv')|



    @API7
    Scenario Outline: Data Driven API testing using CSV file <name>, <gender>, <email>, <status>
    Given url 'https://gorest.co.in/public/v2/users'
    * def requestPayload = {name:'#(name)', gender:'#(gender)', email:'#(email)', status:'#(status)'}
    * print requestPayload
    And header Authorization = 'Bearer 8264487620823d6265505a396a4110de9a3c7ec3db02260a6b8550ec4311f156' 
    Then request requestPayload
    Then method post
    And status 201
    Then print response
    Then match response ==
    """
    {
    id: '#number',
    name: '#string',
    email: '#string',
    gender: '#string',
    status: '#string'
    }
    """
    Examples:
    |read('MOCK_DATA.csv')|


@API8
Scenario: generate random username and email and then pass in request
  * def datagenerator = Java.type("BenchmarkEducation.Datagenerator.RandomdataGenerator")
  * def fname = datagenerator.randomName()
  * def randomeamil = datagenerator.getRandomEmail()
  * def gender = datagenerator.getGender()
  * def requestPayload = {name:'#(fname)', gender:'#(gender)', email:'#(randomeamil)', status:"Active"}

    Given url 'https://gorest.co.in/public/v2/users'
    And header Authorization = 'Bearer 8264487620823d6265505a396a4110de9a3c7ec3db02260a6b8550ec4311f156'
    Then request requestPayload
    Then method post
    And status 201
  * print requestPayload
    Then print response
    Then match response ==
    """
    {
    id: '#number',
    name: '#string',
    email: '#string',
    gender: '#string',
    status: '#string'
    }
    """


@CreateCust
Scenario: Create customization thru API
  * def datagenerator = Java.type("BenchmarkEducation.Datagenerator.RandomdataGenerator")
  * def custom = datagenerator.getNumber()
  * print custom
  Given url 'https://supervisor-staging.benchmarkuniverse.com/presentations/create?sid=24e473e74c84fded1722d30e9abca33d3a2f9799'
  Then form field name = "Cust number "+ custom
  And form field vCode = "X04368"
  And form field locked = "false"
  Then method post
  And status 200
* print response

