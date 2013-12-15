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
	String fahrzeugmasse
	String jahressteuer
	String energietraegerkosten
	String co2Effizienz

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
		modell(blank: false, nullable: false)
		farbe(blank: false, nullable: false)
		baujahr(blank: true, nullable: true)
		kw()
		kmStand(nullable: true)
		preis()
        ausstattung(maxSize: 1073741824, blank: false, nullable: false)
		gebraucht(nullable: true)
		neu(nullable: true)

		kombiniert(blank: false, nullable: false)
        innerorts(blank: false, nullable: false)
        ausserorts(blank: false, nullable: false)
        co2(blank: false, nullable: false)
		fahrzeugmasse(blank: true, nullable: true)
		jahressteuer(blank: true, nullable: true)
		energietraegerkosten(blank: true, nullable: true)
		co2Effizienz(blank: true, nullable: true)
   }

    public String toString()
    {
        return "$marke $modell"
    }


}
