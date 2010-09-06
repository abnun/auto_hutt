<html>
<head>
	<title><g:layoutTitle default="Auto Hutt GmbH - 1a Autoservice"/></title>
	<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1"/>
	<meta name="description" content="Willkommen auf www.autohutt.de - ihrem 1a Autoservicepartner in Leingarten. 
	Wenn Sie 1a Leistungen bei Wartung, Reparatur oder Einbau erwarten, sind Sie bei uns richtig. Auch bei Ihrer
	individuellen Fahrzeugsuche nach einem Neuen oder Gebrauchten sind wir Ihnen gerne behilflich und beraten Sie
	in allen Bereichen. Preiswert - schnell - termingerecht!"/>

	<link rel="stylesheet" href="${resource(dir: 'css', file: 'base.css')}"/>
	<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>

	<g:layoutHead />

	<g:javascript library="application"/>

    <script type="text/javascript" src="${resource(dir: 'highslide', file: 'highslide.js')}"></script>
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'highslide', file: 'highslide.css')}"/>
    <script type="text/javascript">
		hs.registerOverlay({overlayId: 'closebutton',position: 'top right',fade: 2});
		// remove the registerOverlay call to disable the close button
		// fading the semi-transparent overlay looks bad in IE

        hs.graphicsDir = '${resource(dir: 'highslide/graphics/')}';
        hs.showCredits = false;
    </script>

	<style type="text/css">

	/* ... file-local CSS props ... */

	</style>

<!--[if IE 7]>
	<style type="text/css">
		#contentDiv {
			width: 705px;
		}
	</style>
<![endif]-->

</head>

<script type="text/javascript">
	var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
	document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>

<script type="text/javascript">
	try
	{
		var pageTracker = _gat._getTracker("UA-7452991-1");
		pageTracker._trackPageview();
	}
	catch(err)
	{

	}
</script>

<body>

<div id="uberwrapperDiv">

<div id="wrapperDiv">

	<div id="headerDiv">
		<map name="auto_hutt" id="auto_hutt">
			<area shape="circle" coords="134,90,85" href="${resource(dir: '')}"  alt="" >
		</map>
		<div class="logo"><img src="${resource(dir: 'images', file: 'auto_hutt_header_1000px.jpg')}" alt="Auto Hutt GmbH - 1a Autoservice" usemap="#auto_hutt" /></div>
	</div>

	<div id="naviDiv">

		<div class="textcenter">
			<img src="${resource(dir: 'images', file: 'menue_header.gif')}" alt="Auto Hutt GmbH - 1a Autoservice" style="margin-top: 10px;" />
		</div>

		<div>

			<!--<br />-->
			<h4 style="margin-top: 10px;">
				Unser Service:
			</h4>

		</div>

		<ul>

			%{--<li style="border-top: 1px solid white;">

				<g:link controller="inhalt" action="lagerfahrzeuge_nl">Lagerfahrzeuge aus NL</g:link>

			</li>--}%

			<li>

                <a href="http://www.apec-sales.de/index.php?parid=13&verify=498763028723452&c=3&P=1" target="_blank">Lagerfahrzeuge aus I</a>

            </li>

			<li>

				<g:link controller="inhalt" action="lagerfahrzeuge_i_f_dk">Lagerfahrzeuge aus I, F, DK</g:link>

            </li>

			<li>

				<g:link controller="inhalt" action="neufahrzeuge_eu">EU-Neufahrzeuge</g:link>

			</li>

			<li>
				<!--<a href="http://www.eln.de/Fahrzeugangebote/frmFahrzeugangebote_ErweiterteSuche.php" target="_blank">Jahresfahrzeuge</a>-->
				<g:link controller="inhalt" action="jahresfahrzeuge">Jahresfahrzeuge</g:link>
			</li>

			<li>

				<g:link controller="inhalt" action="gebrauchtfahrzeuge">Gebrauchtfahrzeuge</g:link>

			</li>

			<li>

				<a href="http://www.dat.de/gebraucht.html" target="_blank">DAT Gebrauchtfahrzeugbewertung</a>

			</li>

			<li>

				<g:link controller="inhalt" action="kreditrechner">Kreditrechner</g:link>

			</li>

			<li>

				<g:link controller="inhalt" action="leistungen">Leistungen</g:link>

			</li>

			<li>

				<a href="http://www.go1a.de/" target="_blank">Aktuelle Angebote</a>
				%{--<g:link controller="inhalt" action="aktuelle_angebote">Aktuelle Angebote</g:link>--}%

			</li>

			<li>

				<g:link controller="inhalt" action="tuev_au">T&Uuml;V &amp; AU</g:link>

			</li>

		</ul>

		<div>

			<br />
			<h4>
				Wie Sie uns erreichen:
			</h4>

		</div>

		<ul>

			<li>

				<g:link controller="inhalt" action="kontakt">Kontakt &amp; &Ouml;ffnungszeiten</g:link>

			</li>

			<li>

				<g:link controller="inhalt" action="anfahrt">Anfahrt</g:link>

			</li>

		</ul>

		<ul>

			<li>

				<g:link controller="inhalt" action="impressum">Impressum</g:link>

			</li>

		</ul>

	</div>

	<div id="contentDiv">
		<g:if test="${params.action == 'home'}">
            <div id="addressDiv">
              <g:render template="/layouts/address"/>
            </div>
		</g:if>

		<g:layoutBody />

	</div>

</div>

</div>

</body>
</html>