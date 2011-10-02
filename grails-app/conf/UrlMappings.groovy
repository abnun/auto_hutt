class UrlMappings
{
	static mappings =
	{

		name fahrzeugAnzeigen: "/fahrzeug/anzeigen/$id/$marke-$modell" {
			controller = 'fahrzeug'
			action = 'anzeigen'
		}

		"/"(controller: 'inhalt')

		"/liste/$action"(controller: 'fahrzeug', action: 'index')

		"/liste/gebrauchtfahrzeuge"(controller: 'fahrzeug', action: 'gebrauchtfahrzeuge')

		"/liste/lagerfahrzeuge"(controller: 'fahrzeug', action: 'lagerfahrzeuge')

		"/login"(controller: 'authentication', action: 'index')

		"/$controller/$action?/$id?" {
			constraints {
				// apply constraints here
			}
		}

		"/"(controller: 'inhalt', action: "home")

		//		"/"(view:'/index')
		"500"(view: '/error')
	}
}
