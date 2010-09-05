package de.autohutt.domain

import de.webmpuls.photo_album.Picture

class Fahrzeug implements Serializable
{
	FahrzeugMarke marke
	String modell
	String farbe
	Integer kw
	Integer kmStand
	Double preis
	String baujahr
    String ausstattung
    String kombiniert
    String innerorts
    String ausserorts
    String co2

	Boolean gebraucht
	Boolean neu

	static hasMany = [bilder: Picture]

	static mapping =
	{
		cache true
		bilder(cache:true)
  	}

	static constraints =
	{
        marke()
		modell()
		farbe()
		baujahr(nullable: true)
		kw()
		kmStand(nullable: true)
		preis()
        ausstattung()
		gebraucht(nullable: true)
		neu(nullable: true)
        kombiniert(blank: false)
        innerorts(blank: false)
        ausserorts(blank: false)
        co2(blank: false)
   }

    public String toString()
    {
        return "$marke $modell"
    }


}
