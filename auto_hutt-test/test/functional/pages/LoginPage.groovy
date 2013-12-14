package pages

class LoginPage extends MasterPage
{
	static url = "login"

	static at = {
		heading.text().startsWith("Anmeldung erforderlich")
	}

	static content = {
		user { $("form").find("input", name: "user") }
		password { $("form").find("input", name: "password") }

		loginButton { $("form").find("input", name: "submit") }
	}
}
