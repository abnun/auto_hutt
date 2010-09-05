package de.autohutt.service

import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.springframework.web.multipart.MultipartFile
import de.autohutt.domain.Bild
import de.webmpuls.photo_album.PictureService

class ImageService
{

    boolean transactional = false

    Bild createImage(MultipartFile file, int position, Long fahrzeugId)
    {
		/*String origFileName = file.getOriginalFilename()

		String endOfFileName = origFileName.substring(origFileName.lastIndexOf(".") + 1, origFileName.length())

        String endOfCreatedImage = ".png"

        String dateiNameThumbnail = "${ApplicationHolder.application.config.media.save.dir}${fahrzeugId.toString()}_${position}_klein${endOfCreatedImage}"
        String dateiNameThumbnail4DB = "${ApplicationHolder.application.config.media.dir}${fahrzeugId.toString()}_${position}_klein${endOfCreatedImage}"
        String dateiNameNormal = "${ApplicationHolder.application.config.media.save.dir}${fahrzeugId.toString()}_${position}_normal${endOfCreatedImage}"
        String dateiNameNormal4DB = "${ApplicationHolder.application.config.media.dir}${fahrzeugId.toString()}_${position}_normal${endOfCreatedImage}"
        String dateiNameBig = "${ApplicationHolder.application.config.media.save.dir}${fahrzeugId.toString()}_${position}_gross${endOfCreatedImage}"
        String dateiNameBig4DB = "${ApplicationHolder.application.config.media.dir}${fahrzeugId.toString()}_${position}_gross${endOfCreatedImage}"

        String encoding = "PNG"

        if(endOfFileName.toUpperCase() != "JPG" && endOfFileName.toUpperCase() != "GIF")
        {
            encoding = endOfFileName.toUpperCase()
        }

		pictureService.uploadPhotos(file, )
        ImageTool imageTool = new ImageTool()
        imageTool.load(file.getBytes())
        imageTool.saveOriginal()

        imageTool.thumbnailSpecial(80, 80, 3, 2)

        imageTool.writeResult(dateiNameThumbnail, encoding)

        imageTool.square()

        imageTool.restoreOriginal()

        imageTool.thumbnailSpecial(400, 450, 3, 1)

        imageTool.writeResult(dateiNameNormal, encoding)

        imageTool.square()

        imageTool.restoreOriginal()

        imageTool.thumbnailSpecial(600, 600, 3, 1)

        imageTool.writeResult(dateiNameBig, encoding)

        imageTool.square()

		def bildCriteria = Bild.createCriteria()
        Bild media = bildCriteria.get
        {
            eq('dateiNameKlein', dateiNameThumbnail4DB)
            eq('dateiNameNormal', dateiNameNormal4DB)
            eq('dateiNameGross', dateiNameBig4DB)
			eq('position', position)
        }
        if(!media)
        {
            media = new Bild()
			log.debug("Erstelle neues Bild")
        }
        media.dateiNameKlein = dateiNameThumbnail4DB
        media.dateiNameGross = dateiNameBig4DB
        media.dateiNameNormal = dateiNameNormal4DB
        media.position = position

        return media*/
		return null
	}
}
