@ignore
Feature: Common Features 


Background: 
# Read Locators
* def locators = read('classpath:BenchmarkEducation/locators.json')
* def testData = read('classpath:BenchmarkEducation/testData.json')


@SignIn
Scenario: SignIn 
 
  When retry(NoOfRetry).waitForText("//h2[@id='sign-in-header']",'Sign in')
  And input(locators.TestLogin.Username, Login.Username , 100) 
  And input(locators.TestLogin.Password, Login.Password , 100)
  And click(locators.TestLogin.Submit)
  # Below is hardcoded to show usage. This needs to go in Locators / Test Data

@Logout
Scenario: Logout
  And retry(NoOfRetry).waitForUrl("/logged-in-successfully/")
  And retry(NoOfRetry).waitForText("//h1[@class='post-title']", 'Logged In Successfully')
  And retry(NoOfRetry).click(locators.Logout.LogoutButton)
  



  

