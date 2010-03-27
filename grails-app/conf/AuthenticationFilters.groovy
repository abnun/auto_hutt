/**
 * Created by IntelliJ IDEA.
 * User: muellerm
 * Date: 30.05.2008
 * Time: 11:19:55
 * To change this template use File | Settings | File Templates.
 */
class AuthenticationFilters 
{
	def filters =
	{
		car(controller:'fahrzeug', action:'*')
		{
			before =
			{
				if(!session.user && !actionName.equals('show') && !actionName.equals('anzeigen') && !actionName.equals('gebrauchtfahrzeuge') && !actionName.equals('lagerfahrzeuge') && !actionName.equals('bestellfahrzeugeFreiKonfigurierbar') && !actionName.equals('fahrzeugeImVorlauf') && !actionName.equals('gebrauchtfahrzeuge3Bis5Jahre') && !actionName.equals('jahreswagen') && !actionName.equals('neuUndJahreswagenBis24Monate') && !actionName.equals('neuwagenOhneZulassung'))
				{
					println("no access -> $params")
					session.oldController = params.controller
					session.oldAction = params.action

					redirect(controller: 'authentication', action:'login')
					return false
				}
				else
				{
					println("acces granted -> $params")
					return true
				}
			}
		}
		brand(controller:'fahrzeugMarke', action:'*')
		{
			before =
			{
				if(!session.user && !actionName.equals('show'))
				{
					log.debug("params -> $params")
					session.oldController = params.controller
					session.oldAction = params.action

					redirect(controller: 'authentication', action:'login')
					return false
				}
			}
		}
		excel(controller:'excel', action:'*')
		{
			before =
			{
				if(!session.user && !actionName.equals('show'))
				{
					log.debug("params -> $params")
					session.oldController = params.controller
					session.oldAction = params.action

					redirect(controller: 'authentication', action:'login')
					return false
				}
			}
		}
		picture(controller:'bild', action:'*')
		{
			before =
			{
				if(!session.user)
				{
					log.debug("params -> $params")
					session.oldController = params.controller
					session.oldAction = params.action

					redirect(controller: 'authentication', action:'login')
					return false
				}
			}
		}
	}
}