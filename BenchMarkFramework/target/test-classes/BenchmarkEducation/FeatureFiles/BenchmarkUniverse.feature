@Regression
Feature: GoodLife Framework

Background:
* def locators = read('classpath:BenchmarkEducation/locators.json')
* def testData = read('classpath:BenchmarkEducation/testData.json')
* def Mobile = { x: 0, y: 0, width: 300, height: 800 }
* def Desktop = { x: 0, y: 0, width: 1920, height: 1080 }
* def Viewport = MobileViewPort == true ? Mobile : Desktop
#* configure driver = { type: 'chrome', headless: true }



@Test1,@Smoke
Scenario: Create a Assignmnet with ebook
    Given driver baseUrl
    * maximize()
    When retry(NoOfRetry).waitForText("//h2[@id='sign-in-header']",'Sign in')
    And input("//input[@id='username']" , "pteach1" , 100)
    And input("//input[@id='password']" , "password" , 100)
    When click("//button[@type='submit']")
    Then retry(NoOfRetry).waitFor("//button[@class='button ']").click()
    And retry(NoOfRetry).waitFor("//div[@class='inbox-icon']").click()  
    And retry(NoOfRetry).waitFor("//div[@class='menu-icon ']").click()   
    And retry(NoOfRetry).waitFor("//li[@id='library']").click()   
    * retry(NoOfRetry).waitForText("//h3[text()='Alphabet Books and First-Time Readers']",'Alphabet Books and First-Time Readers')
    Then mouse().move("//div[@id='0-B07271']//div[@id='mainContentResource_0']").go()
    * delay(1000)
    Then click("//div[@id='0-B07271']//div[contains(@class,'checkmark-icon unchecked')]")
    Then click("//span[normalize-space()='Add to Assignment']")
    * delay(1000)
    Then click("//input[@id='outlined-basic']").clear()
    And delay(1000).input("//input[@id='outlined-basic']" , "Assignment1" , 100)
    * delay(5000)
















@Test2,@Smoke
Scenario: launch different library and check it is loading
    Given driver baseUrl
    * maximize()
    When retry(NoOfRetry).waitForText("//h2[@id='sign-in-header']",'Sign in')
    And input("//input[@id='username']" , "pteach1" , 100)
    And input("//input[@id='password']" , "password" , 100)
    When click("//button[@type='submit']")
    * retry(NoOfRetry).waitFor("//a[@href='#/library/X35693']").click()
    * retry(NoOfRetry).waitForText("//h3[text()='Whole Group Teacher Resources']",'Whole Group Teacher Resources')
    And retry(NoOfRetry).waitFor("//textarea[@id='notstudent-library-ddl']").click()
    And retry(NoOfRetry).waitFor("//body[1]/div[1]/div[1]/div[1]/div[2]/section[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/nav[1]/div[3]/div[1]/div[1]/div[1]/div[1]/div[1]/button[1]").click()
    * def elements = locateAll("//div[text()='RIGOR']")
    * elements[0].click()
    #And click("//div[text()='Writer's Workshop']")
   * delay(5000)




@Test3
Scenario:Search resouce in Libary
    Given driver baseUrl
    * maximize()
    * karate.call("ReUsable.feature@SignIn", {Login:testData.TestLogin})
    * retry(NoOfRetry).waitForText("//h3[text()='Curriculum Resources']",'Curriculum Resources')
    * retry(NoOfRetry).waitFor("//a[@href='#/library/X35693']").click()
    * retry(NoOfRetry).waitForText("//h3[text()='Whole Group Teacher Resources']",'Whole Group Teacher Resources')
    * retry(NoOfRetry).input("//input[@id='search_input']" , ['my book', Key.ENTER])
    * retry(NoOfRetry).waitFor("//div[contains(text(),'My Book')]")
    * delay(5000)

@Test4
Scenario: Create customization of a ebook from UI
    Given driver baseUrl
    * maximize()s
    * karate.call("ReUsable.feature@SignIn", {Login:testData.TestLogin})
    * retry(NoOfRetry).waitForText("//h3[text()='Curriculum Resources']",'Curriculum Resources')
    * retry(NoOfRetry).waitFor("//a[@href='#/library/X35693']").click()
    * retry(NoOfRetry).waitForText("//h3[text()='Whole Group Teacher Resources']",'Whole Group Teacher Resources')
    * retry(NoOfRetry).input("//input[@id='search_input']" , ['my book', Key.ENTER])
    * retry(NoOfRetry).waitFor("//div[contains(text(),'My Book')]")
    * retry(5).waitFor("//div[@data-id='X04083']").click()
    * switchPage(1)
    #* retry(20).waitFor("//button[@title='Edit Mode']").click()
    #* retry(NoOfRetry).waitFor("//div[@class='notification']")
    * retry(NoOfRetry).waitFor("//button[@title='Customization Menu']").click()
    * delay(5000)

@Test5
Scenario: Drag and Drop a resource to bookshelf
Given driver baseUrl
And driver maximize()
* karate.call('ReUsable.feature@SignIn',{Login:testData.TestLogin})
* retry(NoOfRetry).waitForText("//h3[text()='Curriculum Resources']",'Curriculum Resources')
* retry(NoOfRetry).waitFor("//a[@href='#/library/X35693']").click()
* retry(NoOfRetry).waitForText("//h3[text()='Whole Group Teacher Resources']",'Whole Group Teacher Resources')
* retry(NoOfRetry).input("//input[@id='search_input']" , ['my book', Key.ENTER])
* retry(NoOfRetry).waitFor("//div[contains(text(),'My Book')]")
* retry(NoOfRetry).waitFor("//h3[1]").click()
* mouse().move("//div[@data-id='X04083']//img[@class='container_wrap__section__thumbnail_image']").down().move("//div[@id='addAssignmentContainer']").up()
* delay(5000)




