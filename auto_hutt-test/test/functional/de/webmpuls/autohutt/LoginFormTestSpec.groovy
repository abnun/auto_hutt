package de.webmpuls.autohutt

import de.webmpuls.autohutt.MasterTestSpec
import pages.LoginPage
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
class LoginFormTestSpec extends MasterTestSpec
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
}
