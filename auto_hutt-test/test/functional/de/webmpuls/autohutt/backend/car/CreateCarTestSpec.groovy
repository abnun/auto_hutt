package de.webmpuls.autohutt.backend.car

import de.webmpuls.autohutt.MasterTestSpec
import pages.LoginPage
import pages.car.CreatePage
import pages.car.ListPage
import spock.lang.Stepwise

/**
 * Created by IntelliJ IDEA.
 * User: markus
 * Date: 16.04.11
 * Time: 23:26
 * To change this template use File | Settings | File Templates.
 */
@Stepwise
class CreateCarTestSpec extends MasterTestSpec
{
    def "Loginseite"()
    {
        when:
        to LoginPage

        then:
        at LoginPage

        expect:
        loginButton
    }

    def "Loginformular ausfuellen"()
    {
        when:
        user.value("markus")
        password.value("kermit")
        loginButton.click()

        then:
        at (ListPage)
    }

	def "Seite 'Neues Fahrzeug erstellen'"()
	{
		when:
		to CreatePage

		then:
		at CreatePage

		expect:
		createButton
	}

	def "Neues Fahrzeug erstellen"()
	{
		when:
        marke.value("Porsche")
        modell.value("Testmodell")
        farbe.value("Testfarbe")
        baujahr.value("Testbaujahr")
        kw.value("51")
        kmStand.value("20")
        preis.value("19999")
        ausstattung.value("ABS mit EBD;\n" +
                "Airbag Fahrer- und Beifahrerseite (Beifahrerairbag deaktivierbar);\n" +
                "Kopfairbags vorne und hinten durchgehend;\n" +
                "Außenspiegel el. verstellbar;\n" +
                "Becherhalter vorn und hinten;\n" +
                "Beleuchtungsfunktion Follow-me-home;\n" +
                "Bordcomputer mit Digitaluhr und Trip Computer;\n" +
                "Bremsleuchte, dritte;\n" +
                "Drehzahlmesser;\n" +
                "Fensterheber el. vorn;\n" +
                "Fernbedienung für Zentralverriegelung;\n" +
                "5-Gang-Schaltgetriebe;\n" +
                "Grundausstattung: Sitze mit Anti-Submarining-Struktur, Akustischer Signaltongeber Sicherheitsgurte vorn, Seitenaufprallschutz, Feuerschutzsystem;\n" +
                "Heckscheibenheizung;\n" +
                "Heckscheibenwischwaschanlage;\n" +
                "Kindersicherung an den hinteren Türen manuell;\n" +
                "Kindersitzbefestigung ISOFIX;\n" +
                "Kopfstütze dritte im Fond versenkbar;\n" +
                "Kopfstützen vorn höhenverstellbar;\n" +
                "Lederlenkrad Axial- und höhenverstellbar;\n" +
                "Make-Up Spiegel in den Sonnenblenden;\n" +
                "Innenausstattung Stoff;\n" +
                "Blaupunkt RDS Highclass-Autoradio mit CD-Player, Lenkrad mit 6 Multifunktionstasten für die Audiobedienung;\n" +
                "Stahlfelgen 6Jx15 mit Bereifung 175/65 R15;\n" +
                "Reifenreparaturset mit Reifenfüllmittel und Kompressor;\n" +
                "Rücksitzbank umklappbar, asymetrisch geteilt;\n" +
                "el. Servolenkung;\n" +
                "Sicherheitsgurte 3-Punkt-Gurte hinten;\n" +
                "Sportfahrwerk;\n" +
                "Wegfahrsperre;\n" +
                "Wärmeschutzverglasung;\n" +
                "Zentralverriegelung")
        kombiniert.value("5,1")
        innerorts.value("6,4")
        ausserorts.value("4,3")
        co2.value("119.0")
        fahrzeugmasse.value("1050")
        jahressteuer.value("44")
        energietraegerkosten.value("1591")
        co2Effizienz.value("d")
        gebraucht.value(true)
        //neu.value("")

        createButton.click()

		then:
		at (CreatePage)
	}
}
