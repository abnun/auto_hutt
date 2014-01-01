navigation = {
    // Declare the "app" scope, used by default in tags
    app {

        // A nav item pointing to HomeController, using the default action
        home()
    }

    fahrzeugAngebot {
        eu_lagerfahrzeuge(controller: "fahrzeug", action: "lagerfahrzeuge", titleText: "EU-Neufahrzeuge ab Lager Leingarten")
        eu_neufahrzeuge_ab_lager_i(url: "http://www.partner.apec-sales.de/index.php?parid=759&verify=209876302872759&p=1", titleText: "EU-Neufahrzeuge ab Lager I", data: [blank: true])
        eu_neufahrzeuge_ab_lager_i_f_dk(url: "http://webspace1.ssis.de/22658eln/-/fahrzeugangebote/124", titleText: "EU-Neufahrzeuge ab Lager I, F, DK", data: [blank: true])
        eu_neufahrzeuge_ab_lager_nl(url: "http://server7.autrado.de/vp-autohutt.de/", titleText: "EU-Neufahrzeuge ab Lager NL", data: [blank: true])
        eu_bestellfahrzeuge(url: "http://webspace1.ssis.de/22658eln/-/fahrzeugangebote/2", titleText: "EU-Bestellfahrzeuge", data: [blank: true])
        d_bestellfahrzeuge(controller: "inhalt", action: "bestellfahrzeuge", titleText: "Deutsche Bestellfahrzeuge zu Top Konditionen") {
            eln(url: "http://webspace1.ssis.de/22658eln/-/deutsche-bestellangebote.html", titleText: "ELN Neuwagen", data: [blank: true])
            pro(url: "http://213.131.235.48/marken?h=9a0534dc2799431d9bf01a68dea1ffc6b3dc41da", titleText: "PRO Neuwagen", data: [blank: true])
        }
        nutzfahrzeuge(url: "http://webspace1.ssis.de/22658eln/-/fahrzeugangebote/1", titleText: "Nutzfahrzeuge", data: [blank: true])
        jahresfahrzeuge(url: "http://webspace1.ssis.de/22658eln/-/fahrzeugangebote/124", titleText: "Jahresfahrzeuge", data: [blank: true])
        gebrauchtfahrzeuge(controller: "inhalt", action: "gebrauchtfahrzeuge", titleText: "Gebrauchtfahrzeuge") {
            standort_leingarten(controller: "liste", action: "gebrauchtfahrzeuge", titleText: "Gebrauchtfahrzeuge am Standort Leingarten")
            kurzfristig_lieferbar_3_5_jahre(url: "http://webspace1.ssis.de/22658eln/-/fahrzeugangebote/124", titleText: "Gebrauchtfahrzeuge 3 - 5 Jahre kurzfristig lieferbar (ELN-Autobörse)", data: [blank: true])
        }
    }

    service {
        dat(url: "http://www.dat.de/online-services/service-fuer-verbraucher/gebrauchtfahrzeugwerte.html", titleText: "DAT Gebrauchtfahrzeugbewertung", data: [blank: true])
        kreditrechner(url: "https://fibot.creditplus.de/fibot/frontend?startMask=MiniRechner&HNr=310460&kondition=pkwR01&anzahlung=ja&rsv=ja", titleText: "Kreditrechner", data: [blank: true])
        leistungen(controller: "inhalt", action: "leistungen", titleText: "Leistungen")
        aktuelle_angebote(url: "http://www.go1a.de/", titleText: "Aktuelle Angebote", data: [blank: true])
        hauptuntersuchung_au(controller: "inhalt", action: "hauptuntersuchung_au", titleText: "Hauptuntersuchung & AU")
    }

    wie_sie_uns_erreichen {
        kontakt(controller: "inhalt", action: "kontakt", titleText: "Kontakt & Öffnungszeiten")
        anfahrt(controller: "inhalt", action: "anfahrt", titleText: "Anfahrt")
        Impressum(controller: "inhalt", action: "impressum", titleText: "Impressum")
    }
}