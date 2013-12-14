package pages

import geb.Page

/**
 * Created by IntelliJ IDEA.
 * User: markus
 * Date: 16.04.11
 * Time: 23:29
 * To change this template use File | Settings | File Templates.
 */
class MasterPage extends Page
{
	static content = {
		heading { $("h1") }
	}

	

}
