package de.autohutt.domain

import de.webmpuls.photo_album.Picture

class Bild
{
	String dateiNameKlein
	String dateiNameNormal
	String dateiNameGross
	String link
	Integer position

	// static hasMany = []
//    static belongsTo = [fahrzeug: Fahrzeug]

	//static transients = ['prop']

	static mapping =
    {
		columns
        {
            position column: '`position`'
			cache: true
        }
    }


	static constraints =
	{
        link(nullable: true)
   	}

	public String toString()
	{
		return dateiNameNormal;
	}
}
