import org.codehaus.groovy.grails.commons.GrailsClassUtils as GCU

grailsHome = Ant.project.properties."environment.GRAILS_HOME"

includeTargets << new File("${grailsHome}/scripts/Init.groovy")
includeTargets << new File("${grailsHome}/scripts/Clean.groovy")
includeTargets << new File("${grailsHome}/scripts/RunApp.groovy")

target('default': "The description of the script goes here!")
{
	//    loeschen, Server neustarten
	println "Cleaning '${projectWorkDir}' and dependencies ..."
	clean()
    println "Done cleaning '${projectWorkDir}' and dependencies ..."
    println "Trying to restart the server ..."
    startServerAgain()
}

target(startServerAgain: "Starts the server after clean-up")
{
	depends( checkVersion, configureProxy, packageApp )
	runApp()
    watchContext()
}
/*
target(doStuff: "The implementation task") {

}*/
