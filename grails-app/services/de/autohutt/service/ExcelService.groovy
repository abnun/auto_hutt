package de.autohutt.service

import org.apache.poi.poifs.filesystem.POIFSFileSystem
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import org.apache.poi.hssf.usermodel.HSSFSheet
import org.apache.poi.hssf.usermodel.HSSFRow
import org.apache.poi.hssf.usermodel.HSSFCell
import java.text.DecimalFormat
import de.autohutt.domain.Fahrzeug
import de.autohutt.domain.FahrzeugMarke

class ExcelService
{

	boolean transactional = false

	def fetchNewCarList(excelFile, gebraucht, neu, deleteOld)
	{
		if(deleteOld == 'on')
		{
			Fahrzeug.list()*.delete(flush: true)
		}

		Fahrzeug fahrzeug

		def file = new File('excel')
		file.deleteOnExit()
		excelFile.transferTo(file)

		if (file)
		{
			def tempFile = file
			//new File("C:\\Dokumente und Einstellungen\\muellerm\\Desktop\\Mitgliederliste Auszug 2008-06-01.xls")
			//			file.transferTo( tempFile )
			log.debug("tempFile -> " + tempFile)
			//			log.debug("tempFile Inhalt -> " + tempFile.text)
			POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(tempFile));
			HSSFWorkbook hssfworkbook = new HSSFWorkbook(fs);
			int k = 0;

			HSSFSheet sheet = hssfworkbook.getSheetAt(0);

			// Liste fuer die neuen Fahrzeuge
			def fahrzeugeNeu = []

			int s = 1;

			//			HSSFRow row = sheet.getRow(s)
			//			HSSFCell cell  = row.getCell((short)1);
			//			println cell.getStringCellValue()

			while (s <= sheet.getLastRowNum())
			{
				HSSFRow row = sheet.getRow(s)

				int r = 1;

				def substring = ""

				fahrzeug = new Fahrzeug()

				while (row && r < row.getLastCellNum())
				{
					HSSFCell cell = row.getCell((short) r);

					if (cell != null && cell.getCellType() == HSSFCell.CELL_TYPE_STRING)
					{
						def value = cell.getStringCellValue()
						log.debug("cellvalue string -> $r $value")

						if (r == 1)
						{
							value = value.trim()
							FahrzeugMarke marke = FahrzeugMarke.findByName(value)
							if(!marke)
							{
								marke = new FahrzeugMarke(name: value)
								marke.save(flush: true)
								marke = FahrzeugMarke.findByName(value)
								log.debug("marke -> $marke")
							}
							fahrzeug.marke = marke

						}

						if (r == 2)
						{
							fahrzeug.modell = value
						}

						if (r == 3)
						{
							fahrzeug.farbe = value
						}

						if (r == 4)
						{
							fahrzeug.baujahr = value
						}

						/*if (r == 5)
						{
							fahrzeug.kw = value
						}

						if (r == 6)
						{
							fahrzeug.kmStand = value
						}*/

						if (r == 7)
						{
							if(value)
							{
								DecimalFormat decimalFormat = new DecimalFormat("######")

								def index = value.indexOf(",--")
								if (index != -1)
								{
									value = value.substring(0, value.indexOf(",--"))
								}
								else
								{
									value = value.substring(0, value.indexOf(".--"))
								}
								value = value.substring(0, value.indexOf(".")) + value.substring(value.indexOf(".") + 1, value.length())

								value = decimalFormat.parse(value.trim()).toString()
								log.debug("preis -> $value")

								fahrzeug.preis = Double.parseDouble(value)
							}
						}
					}
					if (cell != null && cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC)
					{
						def value = cell.getNumericCellValue()
						log.debug("cellvalue numeric -> $r $value")

						if (r == 5)
						{
							fahrzeug.kw = (int)value
						}

						if (r == 6)
						{
							fahrzeug.kmStand = (int)value
						}
					}
					r++;
				}

				if(gebraucht == 'on')
				{
					fahrzeug.gebraucht = true
				}
				else if(neu == 'on')
				{
					fahrzeug.neu = true
				}

				if (fahrzeug.validate())
				{
					fahrzeugeNeu << fahrzeug
				}
				else
				{
					fahrzeug.errors.each
					{
						println it
					}
				}

				s++;
			}
			if (fahrzeugeNeu)
			{
				fahrzeugeNeu*.save(flush: true)
			}
		}
		log.debug(Fahrzeug.list()*.modell)
	}
}
