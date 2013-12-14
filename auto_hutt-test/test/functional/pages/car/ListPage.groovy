package pages.car

import pages.MasterPage

class ListPage extends MasterPage
{
    static url = "fahrzeug/list"

    static at = {
        heading.text().startsWith("Fahrzeug-Liste")
    }

    static content = {
        fahrzeugNeu { $("a", text: "Neues Fahrzeug erzeugen") }
    }
}
