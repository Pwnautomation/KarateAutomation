function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  var MobileViewPort;
  var browser = karate.properties['browser'] || 'chrome';
  var NoOfRetry;

  //var browser = karate.configure('driver', { type: 'chromedriver', executable:'\/Users\/icf2038136\/Automation\/chromedriver'});

  
  if (!env) {
  env = 'staging'  }
 

  var config = {
    env: env,
    browser:browser,
    MobileViewPort: false,
    NoOfRetry:10

  }

  if (browser == 'chrome') {
  karate.configure('driver', { type: 'chrome', addOptions: ["--remote-allow-origins=*"] });
  }
  else if (browser == 'safari') {
   karate.configure('driver', { type: 'safaridriver' });
  }

  if (env == 'qa') {
    baseUrl = "https://practicetestautomation.com/practice-test-login/"
    }
    
    else if (env == 'staging') {
    baseUrl = "https://lms2-staging.benchmarkuniverse.com/?realm=bec-micro#"
    
  }

  return config;
}