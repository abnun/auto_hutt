package de.autohutt.controllers

import org.springframework.web.multipart.MultipartFile
import de.autohutt.domain.Fahrzeug
import de.webmpuls.photo_album.Album
import de.webmpuls.photo_album.Picture
import de.autohutt.domain.FahrzeugMarke

class FahrzeugController
{
	def pictureService

	def index =
	{
		redirect(action:list,params:params)
	}

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list =
	{
        if(!params.sort)
		{
			params.sort = 'marke'
		}
		if(!params.order)
		{
			params.order = 'asc'
		}

		Collection fahrzeugList = Fahrzeug.list( params )
		fahrzeugList = sortMarke(params, fahrzeugList)

		[ fahrzeugList: fahrzeugList ]
    }

    def show =
	{
        def fahrzeug = Fahrzeug.get( params.id )

        if(!fahrzeug)
		{
            flash.message = "Fahrzeug mit der ID ${params.id} konnte nicht gefunden werden!"
            redirect(action:list)
        }
        else
		{
			return [ fahrzeug : fahrzeug ]
		}
    }

    def delete =
	{
        def fahrzeug = Fahrzeug.get( params.id )

		if(fahrzeug)
		{
            fahrzeug.delete()
            flash.message = "Fahrzeug ${params.id} gel&ouml;scht!"
            redirect(action:list)
        }
        else
		{
            flash.message = "Fahrzeug mit der ID ${params.id} konnte nicht gefunden werden!"
            redirect(action:list)
        }
    }

    def edit =
	{
        def fahrzeug = Fahrzeug.get( params.id )

        if(!fahrzeug)
		{
            flash.message = "Fahrzeug mit der ID ${params.id} konnte nicht gefunden werden!"
            redirect(action:list)
        }
        else
		{
            return [ fahrzeug : fahrzeug ]
        }
    }

    def update =
	{
		println "params -> $params"

		def fahrzeug = Fahrzeug.get( params.id )

		if ( !checkAufGebrauchtUndNeu( params ) )
		{
			flash.message = "Fahrzeug kann nicht gleichzeitig gebraucht und neu sein!"
			render(view:'edit',model:[fahrzeug:fahrzeug])
			return false
		}


		if(fahrzeug)
		{
            fahrzeug.properties = params

			if(!fahrzeug.hasErrors() && fahrzeug.save())
			{
                flash.message = "Fahrzeug '${fahrzeug.marke} ${fahrzeug.modell}' wurde ge&auml;ndert!"
                redirect(action: 'anzeigen', id: fahrzeug.id, mapping: 'fahrzeugAnzeigen', params: [marke: fahrzeug.marke, modell: fahrzeug.modell])
            }
            else
			{
                render(view:'edit',model:[fahrzeug:fahrzeug])
            }
        }
        else
		{
            flash.message = "Fahrzeug mit der ID ${params.id} konnte nicht gefunden werden!"
            redirect(action:edit,id:params.id)
        }
    }

	def editAusstattung =
	{
		log.debug("params -> $params")

		Fahrzeug fahrzeug = null
		if (params.id)
		{
			if (Fahrzeug.exists(params.id))
			{
				fahrzeug = Fahrzeug.get(params.id)
				log.debug("fahrzeug from params -> $fahrzeug")
			}
		} 
		[fahrzeug: fahrzeug]
	}

	/*def bindFahrzeugAusstattungenToCar2 =
	{
		log.debug("params bindFahrzeugAusstattungenToCar -> $params")

		Fahrzeug fahrzeug = session.fahrzeug
		if (params.fahrzeugId)
		{
			if (Fahrzeug.exists(params.fahrzeugId))
			{
				fahrzeug = Fahrzeug.get(params.fahrzeugId)
				log.debug("fahrzeug from params -> $fahrzeug")
			}
		}

		if (Boolean.valueOf(params.isNewAusstattung))
		{
			if (params.newAusstattung && params.newAusstattung != " ")
			{
				String[] newAusstattungen = params.newAusstattung.split(",")
				newAusstattungen.each
				{
					Fahrzeugausstattung newAusstattung = Fahrzeugausstattung.findByName(it.trim())
					if (!newAusstattung)
					{
						newAusstattung = new Fahrzeugausstattung(name: it)
						if (newAusstattung.save(flush: true))
						{
							fahrzeug.addToAusstattungen(newAusstattung)
						}
						else
						{
							flash.message = "Konnte die Ausstattung nicht speichern!"
							log.error("Could not save Ausstattung with name -> ${it}")
						}
					}
				}
			}
		}
		else if (params.values.contains("on"))
		{
			params.each
			{
				if (it.value == "on")
				{
					Fahrzeugausstattung newAusstattung = Fahrzeugausstattung.findByName(it.key.trim())
					if (newAusstattung)
					{
						if(fahrzeug.ausstattungen*.id.contains(newAusstattung.id))
						{
							fahrzeug.removeFromAusstattungen(newAusstattung)
						}
						else
						{
							fahrzeug.addToAusstattungen(newAusstattung)
						}
					}
					else
					{
						flash.message = "Konnte die Ausstattung nicht speichern!"
						log.error("Could not save Ausstattung with name -> ${it}")
					}
				}
			}
		}
		if (fahrzeug.save(flush: true))
		{
			log.debug("Fahrzeug -> ${fahrzeug.dump()}")
		}
		else
		{
			flash.message = "Konnte die Ausstattung nicht an das Fahrzeug speichern!"

			fahrzeug.errors.allErrors.each
			{
				println it
			}
		}
		redirect(action: 'list')
	}*/

    def uploadPictures =
    {
		log.debug("params -> $params")

        return [fahrzeug: Fahrzeug.get(params.id)]
    }

    def bindPicturesToCar =
    {
        println "params bindPicturesToCar -> $params"

		Fahrzeug fahrzeug = session.fahrzeug
		if(params.fahrzeugId)
		{
			if(Fahrzeug.exists(params.fahrzeugId))
			{
				fahrzeug = Fahrzeug.get(params.fahrzeugId)
				log.debug("fahrzeug from params -> $fahrzeug")
			}
		}

        MultipartFile file1 = request.getFile("picture1")
        MultipartFile file2 = request.getFile("picture2")
        MultipartFile file3 = request.getFile("picture3")

		Album tmpAlbum = null

		if(fahrzeug.gebraucht)
		{
			tmpAlbum = Album.withName("gebrauchtwagen").list().first()
		}
		else if(fahrzeug.neu)
		{
			tmpAlbum = Album.withName("neuwagen").list().first()
		}

        if(file1 && !file1.isEmpty())
        {
			String fileName = "${fahrzeug.id.toString()}_1"

			Picture newMedia1 = null
            if(pictureService.upload(file1, "/" + tmpAlbum.getName(), "", fileName, tmpAlbum.id.toString()))
            {
                log.debug("fahrzeug -> $fahrzeug")

				newMedia1 = Picture.findByBaseNameAndAlbum(fileName, tmpAlbum)
				newMedia1.position = 1
				fahrzeug.addToBilder(newMedia1)
                if (!fahrzeug.hasErrors() && fahrzeug.save(flush: true))
                {
                    flash.message = "Bilder erfolgreich gespeichert"
                }
                else
                {
                    fahrzeug.errors.allErrors.each
                    {
                      println it
                    }
                }
            }
            else
            {
                flash.error = "Bild konnte nicht gespeichert werden"

                newMedia1.errors.allErrors.each
                {
                    println it
                }
                redirect(action: 'uploadPictures', id: fahrzeug.id)
                return false
            }
        }

        if(file2 && !file2.isEmpty())
        {
			String fileName = "${fahrzeug.id.toString()}_2"

			Picture newMedia2 = null
            if(pictureService.upload(file2, "/" + tmpAlbum.getName(), "", fileName, tmpAlbum.id.toString()))
            {
                log.debug("fahrzeug -> $fahrzeug")

				newMedia2 = Picture.findByBaseNameAndAlbum(fileName, tmpAlbum)
				newMedia2.position = 2
				fahrzeug.addToBilder(newMedia2)

				if (!fahrzeug.hasErrors() && fahrzeug.save(flush: true))
                {
                    flash.message = "Bilder erfolgreich gespeichert"
                }
                else
                {
                    fahrzeug.errors.allErrors.each
                    {
                      println it
                    }
                }
            }
            else
            {
                flash.error = "Bild konnte nicht gespeichert werden"

                newMedia2.errors.allErrors.each
                {
                    println it
                }
                redirect(action: 'uploadPictures', id: fahrzeug.id)
                return false
            }
        }

        if(file3 && !file3.isEmpty())
        {
			String fileName = "${fahrzeug.id.toString()}_3"

			Picture newMedia3 = null
            if(pictureService.upload(file3, "/" + tmpAlbum.getName(), "", fileName, tmpAlbum.id.toString()))
            {
                log.debug("fahrzeug -> $fahrzeug")

				newMedia3 = Picture.findByBaseNameAndAlbum(fileName, tmpAlbum)
				newMedia3.position = 3
				fahrzeug.addToBilder(newMedia3)

				if (!fahrzeug.hasErrors() && fahrzeug.save(flush: true))
                {
                    flash.message = "Bilder erfolgreich gespeichert"
                }
                else
                {
                    fahrzeug.errors.allErrors.each
                    {
                      println it
                    }
                }
            }
            else
            {
                flash.error = "Bild konnte nicht gespeichert werden"

                newMedia3.errors.allErrors.each
                {
                    println it
                }
                redirect(action: 'uploadPictures', id: fahrzeug.id)
                return false
            }
        }

        redirect(action: 'uploadPictures', id: fahrzeug.id)
    }

	def create =
	{
        def fahrzeug = new Fahrzeug()
        fahrzeug.properties = params

		return ['fahrzeug':fahrzeug]
    }

    def save =
	{
		log.debug("params -> $params")

        def fahrzeug = new Fahrzeug(params)

		if(!fahrzeug.hasErrors() && fahrzeug.save() && checkAufGebrauchtUndNeu( params ))
		{
            flash.message = "Fahrzeug ${fahrzeug.marke} ${fahrzeug.modell} wurde erzeugt!"

            if(params.newCreate)
            {
              redirect(action:uploadPictures,id:fahrzeug.id)
              return false
            }
            else
            {
              redirect(action:anzeigen,id:fahrzeug.id)
              return false
            }
        }
        else
		{
            fahrzeug.errors.allErrors.each
            {
              println it
            }
            render(view:'create',model:[fahrzeug:fahrzeug])
            return false 
        }
    }

	def gebrauchtfahrzeuge =
	{
		if(!params.sort)
		{
			params.sort = 'marke'
		}
		if(!params.order)
		{
			params.order = 'asc'
		}
		def fahrzeugList = Fahrzeug.createCriteria().list
		{
			eq("gebraucht", true)

			if(params.sort && params.sort != 'marke')
			{
				order(params.sort, params.order)
			}
			cache(true)
		}

		fahrzeugList = sortMarke(params, fahrzeugList)

		[ fahrzeugList: fahrzeugList ]
    }

	def lagerfahrzeuge =
	{
		if(!params.sort)
		{
			params.sort = 'marke'
		}
		if(!params.order)
		{
			params.order = 'asc'
		}

		def fahrzeugList = Fahrzeug.createCriteria().list
		{
			eq("neu", true)

			if(params.sort && params.sort != 'marke')
			{
				order(params.sort, params.order)
			}
			cache(true)
		}

		fahrzeugList = sortMarke(params, fahrzeugList)

		[ fahrzeugList: fahrzeugList ]
    }

	private checkAufGebrauchtUndNeu( paramsMap )
	{
		println paramsMap.gebraucht
		println paramsMap.neu
		if ( paramsMap.gebraucht && paramsMap.gebraucht == 'on' && paramsMap.neu && paramsMap.neu == 'on' )
		{
			flash.message = "Fahrzeug kann nicht gleichzeitig gebraucht und neu sein!"
			return false
		}
		else if(!paramsMap.gebraucht && !paramsMap.neu)
		{
			flash.message = "Fahrzeug muss entweder als gebraucht oder neu markiert sein!"
			return false
		}
		return true
	}

	def anzeigen =
	{
		def fahrzeug = null

		if(params.id)
		{
         	fahrzeug = Fahrzeug.get( params.id )
		}
		else if(params.modell && params.marke)
		{
			FahrzeugMarke tmpMarke = FahrzeugMarke.findByName(params.marke)

			if(tmpMarke)
			{
				fahrzeug = Fahrzeug.findByModellAndMarke(params.modell, tmpMarke)
			}
		}

        if(!fahrzeug)
		{
            flash.message = "Fahrzeug konnte nicht gefunden werden!"
            
			redirect(action:list)
        }
        else
		{
			return [ fahrzeug : fahrzeug ]
		}
    }

	private List sortMarke(paramsMap, fahrzeugList)
	{
		if(params.order == 'asc')
		{
			fahrzeugList = fahrzeugList.sort{ Fahrzeug a, Fahrzeug b -> a.marke.name.toLowerCase() <=> b.marke.name.toLowerCase()}
		}
		else if(params.order == 'desc')
		{
			fahrzeugList = fahrzeugList.sort{ Fahrzeug a, Fahrzeug b -> b.marke.name.toLowerCase() <=> a.marke.name.toLowerCase()}
		}

		return fahrzeugList
	}

	def deleteSelected =
    {
        log.debug("params -> $params")

        params.each()
        {
            if (it.value == 'on')
            {
                log.debug("Fahrzeug mit der ID '" + it.key + "' soll geloescht werden")
                def f = Fahrzeug.get(it.key)

                // Fahrzeug loeschen
                if(Fahrzeug.exists(it.key))
				{
					f.delete(flush: true)
				}
                log.debug("Fahrzeug mit ID " + it.key + " geloescht!")
            }
        }

		redirect(action: 'list')
    }

	def deletePictures =
    {
        log.debug("params -> $params")

        if (Picture.exists(params.id))
		{
			log.debug("Bild mit der ID '" + params.id + "' soll geloescht werden")
			Picture b = Picture.get(params.id)

			Fahrzeug fahrzeug = Fahrzeug.get(params.fahrzeugId)
			if(fahrzeug)
			{
				fahrzeug.removeFromBilder(b)
				fahrzeug.save(flush: true)
			}
			// Bild loeschen
			if (Picture.exists(params.id))
			{
				b = Picture.get(params.id)
				b.delete(flush: true)
			}
			log.debug("Bild mit ID " + params.id + " geloescht!")
		}

		redirect(action: 'uploadPictures', id: params.fahrzeugId)
    }

	def bestellfahrzeugeFreiKonfigurierbar =
	{
		// TODO
	}

	def fahrzeugeImVorlauf =
	{
		// TODO
	}

	def gebrauchtfahrzeuge3Bis5Jahre =
	{
		// TODO
	}

	def jahreswagen =
	{
		// TODO
	}

	def neuUndJahreswagenBis24Monate =
	{
		// TODO
	}

	def neuwagenOhneZulassung =
	{
		// TODO
	}
}
