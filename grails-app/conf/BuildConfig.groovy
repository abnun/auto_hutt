grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

// So heisst das WAR-File nachher
grails.project.war.destFile = "auto_hutt.war"

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // uncomment to disable ehcache
        // excludes 'ehcache'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve

    repositories {
        inherits true // Whether to inherit repository definitions from plugins
        grailsPlugins()
        grailsHome()
        grailsCentral()
        mavenCentral()

		grailsRepo("http://83.169.2.186/grails-svn/plugins/", "myRepository")
        // uncomment these to enable remote dependency resolution from public Maven repositories
        //mavenCentral()
        //mavenLocal()
        //mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
    }
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.

        // runtime 'mysql:mysql-connector-java:5.1.16'
    }

	credentials {
		realm = "myRepository"
		host = "83.169.2.186"
		username = "markus"
		password = "kermit"
	}

    plugins {
        compile ":hibernate:$grailsVersion"
        compile ":jquery:1.7"
        compile ":resources:1.0.2"

        build ":tomcat:$grailsVersion"

		compile (":photo-album:0.8.1") {
			transitive = false
		}

		runtime ":database-migration:1.0"
    }
}

//grails.server.host="10.1.50.228"
//grails.server.host="127.0.0.1"

// Plugin repository
grails.plugin.repos.discovery.myRepository="http://markus:kermit@83.169.2.186/grails-svn/plugins/"
grails.plugin.repos.distribution.myRepository="http://markus:kermit@83.169.2.186/grails-svn/plugins/"

grails.plugin.repos.resolveOrder=['myRepository', 'default', 'core'/*, 'myRepository'*/]

grails.tomcat.jvmArgs = ['-Xmx1024m']

