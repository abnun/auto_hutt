<html>
    <head>
        <meta name="layout" content="html5boilerplate" />
    </head>

    <body>

		<h1 class="textcenter" style="width: 450px;">
			Willkommen auf www.autohutt.de
		</h1>

		<div class="textcenter" style="width: 450px;">
			<b>
				ihrem 1a Autoservicepartner in Leingarten
			</b>
		</div>

        <br />

		<div>
          <img src="${resource(dir: 'images', file: 'startseite.jpg')}" alt="Willkommen" style="margin-left: 80px;"/>
		</div>

        <!--<br />-->

	    %{--<div style="clear: both;"></div>--}%
        <div style="float: right; margin: 15px 20px 10px 10px; *margin: 5px 10px 10px 10px;">
          <img src="${resource(dir: 'images', file: 'eu_fahrzeuge.jpg')}" alt="Eu-Fahrzeuge" border="1" style="margin-bottom: 10px;"/>
          <br/>
          <a href="http://www.bfi-ev.de" target="_blank"><img src="${resource(dir: 'images', file: 'bfi.jpg')}" alt="Bundesverband freier Kfz-Importeure" border="1"/></a>
        </div>
		<div class="textjustify" style="width: 500px;">
            der Systemwerkstatt der Zukunft f&uuml;r alle Marken und Typen.
			<br />
			<br />
			Wenn Sie 1a Leistungen bei Wartung, Reparatur oder Einbau erwarten, sind Sie bei uns richtig.
			<br />
			Auch bei Ihrer individuellen Fahrzeugsuche nach einem Neuen oder Gebrauchten sind wir Ihnen gerne behilflich und beraten Sie in allen Bereichen.
			<br />
			Unsere St&auml;rken sind guter Service und qualifizierte Beratung.
			<br />
			<br />
			Kompetent in Sachen Mechanik - Elektronik - Karosserie
			<br />
			preiswert - schnell - termingerecht
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