import org.openqa.selenium.firefox.FirefoxDriver
import org.openqa.selenium.safari.SafariDriver
import org.openqa.selenium.chrome.ChromeDriver

// start with -Dgrails.server.port.http=8081 -Dgeb.driver=firefox
//driver = { new FirefoxDriver() }
driver = { new ChromeDriver() }
//driver = { new SafariDriver() }

baseUrl = "http://localhost:8080/"
//baseUrl = "http://markus-mueller.name:8080/tojas/"
//baseUrl = "https://www.tojas-olivenbaeume.de/"

System.setProperty("webdriver.chrome.driver", "/Users/markus/Downloads/chromedriver")