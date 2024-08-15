Feature: GoodLife Framework

Background:
* def locators = read('classpath:BenchmarkEducation/locators.json')
* def testData = read('classpath:BenchmarkEducation/testData.json')
* def Mobile = { x: 0, y: 0, width: 300, height: 800 }
* def Desktop = { x: 0, y: 0, width: 1920, height: 1080 }
* def Viewport = MobileViewPort == true ? Mobile : Desktop
#* configure driver = { type: 'chrome', headless: true }



@Demo1
Scenario: Valid Login
 Given driver baseUrl
 And driver.dimensions = Viewport
 * karate.call("ReUsable.feature@SignIn", {Login:testData.TestLogin}) 

@Demo2
 Scenario: Invalid Login
    Given driver baseUrl
    And driver.dimensions = Viewport
    * karate.call("ReUsable.feature@SignIn", {Login:testData.InvalidLogin}) 
        * delay(3000)
    And retry(NoOfRetry).waitForText("//div[@id='error']", "Your password is invalid!")

@Demo3
Scenario: Login
    Given driver 'https://lms2-staging.benchmarkuniverse.com/?realm=bec-micro#'
    * maximize()
    When retry(NoOfRetry).waitForText("//h2[@id='sign-in-header']",'Sign in')
    And input("//input[@id='username']" , "pteach1" , 50)
    And input("//input[@id='password']" , "password" , 50)
    When click("//button[@type='submit']")
    #Then waitForText()
    * delay(20000)
    Then click("//button[@class='button ']") #anouncmentModal
    * delay(10000)
    And click("//div[@class='inbox-icon']")
    * delay(10000)
    And click("//div[@class='menu-icon ']")
    * delay(10000)
    And click("//li[@id='library']")
    * retry(NoOfRetry).waitForText("//h3[text()='Program Review']",'Program Review')