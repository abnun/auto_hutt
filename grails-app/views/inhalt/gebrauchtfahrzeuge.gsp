<html>
    <head>
		<title>Gebrauchtfahrzeuge</title>
        <meta name="layout" content="html5boilerplate" />
    </head>

    <body>

		<h1>
			Gebrauchtfahrzeuge
		</h1>

		<div>
			<ul>
				<li>
					<g:link controller="liste" action="gebrauchtfahrzeuge" style="text-decoration: underline;">Gebrauchtfahrzeuge am Standort Leingarten</g:link>
				</li>
				<li>
                    <a href="http://webspace1.ssis.de/22658eln/-/fahrzeugangebote/124" style="text-decoration: underline;" target="_blank">Gebrauchtfahrzeuge 3 - 5 Jahre kurzfristig lieferbar (ELN-Autob&ouml;rse)</a>
                    %{--<a href="${createLink(controller: 'fahrzeug', action: 'gebrauchtfahrzeuge3Bis5Jahre')}" style="text-decoration: underline;">Gebrauchtfahrzeuge 3 - 5 Jahre kurzfristig lieferbar (ELN-Autob&ouml;rse)</a>--}%
				</li>
				%{--<li>
                    <a href="http://euro-auto-boerse.net/db2/start.php3?username=953a&quickauth=user%22%3Ezugang%3C" target="_blank" style="text-decoration: underline;">... ab 5 Jahre</a>
				</li>--}%
			</ul>
		</div>

	</body>
<r:script>
    $(document).ready(function() {

        var naviheight = $("#naviDiv").outerHeight(true);
        var contentheight = $("#contentDiv").outerHeight(true);

        if(contentheight < naviheight)
        {
            $("#contentDiv").height(naviheight - 20)
        }
    });
</r:script>
</html>