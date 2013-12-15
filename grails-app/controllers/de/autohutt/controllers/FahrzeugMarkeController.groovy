package de.autohutt.controllers

import de.autohutt.domain.FahrzeugMarke

class FahrzeugMarkeController
{
    
    def index =
	{
		redirect(action:list,params:params)
	}

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list =
	{
        //if(!params.max) params.max = 10
        [ fahrzeugMarkeList: FahrzeugMarke.listOrderByName( params ) ]
    }

    def show =
	{
        def fahrzeugMarke = FahrzeugMarke.get( params.id )

        if(!fahrzeugMarke)
		{
            flash.message = "Fahrzeugmarke mit der ID ${params.id} konnte nicht gefunden werden!"
            redirect(action:list)
        }
        else
		{
			return [ fahrzeugMarke : fahrzeugMarke ]
		}
    }

    def delete =
	{
        def fahrzeugMarke = FahrzeugMarke.get( params.id )

		if(fahrzeugMarke)
		{
            fahrzeugMarke.delete()
            flash.message = "Fahrzeugmarke '${fahrzeugMarke.name}' gelöscht!"
            redirect(action:list)
        }
        else
		{
            flash.message = "Fahrzeugmarke mit der ID ${params.id} konnte nicht gefunden werden!"
            redirect(action:list)
        }
    }

    def edit =
	{
        def fahrzeugMarke = FahrzeugMarke.get( params.id )

        if(!fahrzeugMarke)
		{
            flash.message = "Fahrzeugmarke mit der ID ${params.id} konnte nicht gefunden werden!"
            redirect(action:list)
        }
        else
		{
            return [ fahrzeugMarke : fahrzeugMarke ]
        }
    }

    def update =
	{
        def fahrzeugMarke = FahrzeugMarke.get( params.id )

		if(fahrzeugMarke)
		{
            fahrzeugMarke.properties = params

			if(!fahrzeugMarke.hasErrors() && fahrzeugMarke.save())
			{
                flash.message = "Fahrzeugmarke '${fahrzeugMarke.name}' wurde geändert!"
                redirect(action:show,id:fahrzeugMarke.id)
            }
            else
			{
                render(view:'edit',model:[fahrzeugMarke:fahrzeugMarke])
            }
        }
        else
		{
            flash.message = "Fahrzeugmarke mit der ID ${params.id} konnte nicht gefunden werden!"
            redirect(action:edit,id:params.id)
        }
    }

    def create =
	{
        def fahrzeugMarke = new FahrzeugMarke()
        fahrzeugMarke.properties = params

		return ['fahrzeugMarke':fahrzeugMarke]
    }

    def save =
	{
        def fahrzeugMarke = new FahrzeugMarke(params)

		if(!fahrzeugMarke.hasErrors() && fahrzeugMarke.save())
		{
            flash.message = "Fahrzeugmarke '${fahrzeugMarke.name}' wurde erzeugt!"
            redirect(action:show,id:fahrzeugMarke.id)
        }
        else
		{
            render(view:'create',model:[fahrzeugMarke:fahrzeugMarke])
        }
    }
}
