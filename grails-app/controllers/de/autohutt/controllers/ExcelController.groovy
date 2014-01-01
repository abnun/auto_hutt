package de.autohutt.controllers
class ExcelController
{
    static navigationScope = 'admin'

	def excelService

	def index =
	{

	}

	def importExcel =
	{
		log.debug("params -> $params")
		def file = request.getFile('file')
		if ( file )
		{
			def gebraucht = params.gebraucht
			def neu = params.neu
			def deleteOld = params.deleteOld
			
			excelService.fetchNewCarList(file, gebraucht, neu, deleteOld)
			flash.message = "Import gelaufen - erfolgreich?"
		}
		else
		{
			flash.message = "Fehler - Zur&uuml;r&uuml;ck im Browser und nochmal probieren!"
		}
	}
}
