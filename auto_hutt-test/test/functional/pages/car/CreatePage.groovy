package pages.car

import pages.MasterPage

class CreatePage extends MasterPage
{
    static url = "fahrzeug/create"

    static at = {
        heading.text().startsWith("Neues Fahrzeug erzeugen")
    }

    static content = {
        marke { $("form").find("select", name: "marke.id") }
        modell { $("form").find("input", name: "modell") }
        farbe { $("form").find("input", name: "farbe") }
        baujahr { $("form").find("input", name: "baujahr") }
        kw { $("form").find("input", name: "kw") }
        kmStand { $("form").find("input", name: "kmStand") }
        preis { $("form").find("input", name: "preis") }
        ausstattung { $("form").find("textarea", name: "ausstattung") }
        kombiniert { $("form").find("input", name: "kombiniert") }
        innerorts { $("form").find("input", name: "innerorts") }
        ausserorts { $("form").find("input", name: "ausserorts") }
        co2 { $("form").find("input", name: "co2") }
        fahrzeugmasse { $("form").find("input", name: "fahrzeugmasse") }
        jahressteuer { $("form").find("input", name: "jahressteuer") }
        energietraegerkosten { $("form").find("input", name: "energietraegerkosten") }
        co2Effizienz { $("form").find("select", name: "co2Effizienz") }
        gebraucht { $("form").find("input", name: "gebraucht") }
        neu { $("form").find("input", name: "neu") }

        createButton { $("form").find("input", value: "Anlegen") }
    }
}
