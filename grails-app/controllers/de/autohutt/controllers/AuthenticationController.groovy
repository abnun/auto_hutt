package de.autohutt.controllers
class AuthenticationController
{

	def allowedUserMaps = [["uli": "hutt"], ["markus": "kermit"]]

	def index =
	{
		redirect(action: 'login')
	}

	def login =
	{

	}

	def logoff =
	{

	}

	def setSessionUserByLogin =
	{
		println("params -> $params")

		def user = params.user
		def password = params.password

		def userMap = [:]
		userMap.put(user, password)

		println("userMap -> $userMap")

		if(allowedUserMaps.contains(userMap))
		{
			session.user = user
			println("set session user -> ${session.user}")
			if(session.oldAction && session.oldController)
			{
				redirect(controller: session.oldController, action: session.oldAction)
			}
			else
			{
				redirect(controller: "fahrzeug", action: 'list')
			}
		}
		else
		{
			flash.message = "Login nicht erfolgreich, Username und Passwort überprüfen!"
			redirect(action: 'login')
		}
	}
}
