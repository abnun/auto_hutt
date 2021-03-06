grails.servlet.version = "3.0" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.work.dir = "target/work"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.project.fork = [
        // configure settings for compilation JVM, note that if you alter the Groovy version forked compilation is required
        //  compile: [maxMemory: 256, minMemory: 64, debug: false, maxPerm: 256, daemon:true],

        // configure settings for the test-app JVM, uses the daemon by default
        test: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, daemon:true],
        // configure settings for the run-app JVM
        run: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, forkReserve:false],
        // configure settings for the run-war JVM
        war: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, forkReserve:false],
        // configure settings for the Console UI JVM
        console: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256]
]

grails.project.dependency.resolver = "ivy" // or ivy
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve
    legacyResolve false // whether to do a secondary resolve on plugin installation, not advised and here for backwards compatibility

    repositories {
        inherits true // Whether to inherit repository definitions from plugins
        grailsRepo("http://svn.webmpuls.de/grails-svn/plugins/", "myRepository")
        grailsRepo "http://grails.org/plugins"
        grailsPlugins()
        grailsHome()
        mavenLocal()
        grailsCentral()
        mavenCentral()

        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
        mavenRepo "http://nexus.openqa.org/content/repositories/releases/"
        mavenRepo "https://repo.grails.org/grails/plugins"
    }

    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes e.g.
        // runtime 'mysql:mysql-connector-java:5.1.24'
        runtime "org.apache.ant:ant:1.8.4"
        runtime "org.apache.ant:ant-launcher:1.8.4"

        build("org.tmatesoft.svnkit:svnkit:1.7.11")

        runtime "org.postgresql:postgresql:9.4.1207.jre7"
    }

    credentials {
        realm = "myRepository"
        host = "svn.webmpuls.de"
        username = "markus"
        password = "kermit"
    }

    plugins {
        // plugins for the build system only
        build ":tomcat:7.0.47"

        // plugins for the compile step
        compile ":scaffolding:2.0.1"
        compile ':cache:1.1.1'

        // plugins needed at runtime but not for compilation
        runtime ":hibernate:3.6.10.4" // or ":hibernate4:4.1.11.4"
        runtime ":database-migration:1.3.8"
        runtime ":jquery:1.10.2.2"
        runtime ":resources:1.2.1"
        // Uncomment these (or add new ones) to enable additional resources capabilities
        //runtime ":zipped-resources:1.0.1"
        //runtime ":cached-resources:1.1"
        //runtime ":yui-minify-resources:0.1.5"

        compile ":external-config-reload:1.4.1"
        compile ":platform-core:1.0.RC6"

        compile ":photo-album:0.9.1"

        compile ":html-five-boilerplate:1.0"
        compile ":modernizr:1.7.2"
        compile ':nine-sixty-grid-system:latest.integration'

        runtime ":database-migration:1.0"
    }
}

// So heisst das WAR-File nachher
grails.project.war.destFile = "auto_hutt.war"

//grails.server.host="10.1.50.228"
//grails.server.host="127.0.0.1"

// Plugin repository
grails.plugin.repos.discovery.myRepository="http://markus:kermit@svn.webmpuls.de/grails-svn/plugins/"
grails.plugin.repos.distribution.myRepository="http://markus:kermit@svn.webmpuls.de/grails-svn/plugins/"

grails.plugin.repos.resolveOrder=['myRepository', 'default', 'core'/*, 'myRepository'*/]

grails.tomcat.jvmArgs = ['-Xmx1024m']
