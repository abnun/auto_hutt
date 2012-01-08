<!doctype html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7 ]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]>    <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]>    <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="no-js" lang="en"><!--<![endif]-->
<head>
    <meta charset="utf-8">

    <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
	       Remove this if you use the .htaccess -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title>Auto Hutt GmbH Leingarten | 1a Autoservice | <g:layoutTitle /></title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta name="keywords" content="auto, hutt, neufahrzeuge, gebrauchtfahrzeuge, lagerfahrzeuge, hauptuntersuchung, au, inspektion, abschleppservice, tuning" />
    <meta name="description" content="Willkommen auf www.autohutt.de - ihrem 1a Autoservicepartner in Leingarten.
	Wenn Sie 1a Leistungen bei Wartung, Reparatur oder Einbau erwarten, sind Sie bei uns richtig. Auch bei Ihrer
	individuellen Fahrzeugsuche nach einem Neuen oder Gebrauchten sind wir Ihnen gerne behilflich und beraten Sie
	in allen Bereichen. Preiswert - schnell - termingerecht!"/>

    <!-- Mobile viewport optimized: j.mp/bplateviewport -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Place favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
    <r:external dir="images" file="favicon.ico" type="ico"/>
    %{--<r:resourceLink dir="images" file="apple-touch-icon.png" type="appleicon"/>--}%

    <g:layoutHead/>
    <r:require modules="auto-hutt"/>
    <r:layoutResources/>
</head>

<body style="background-color: #D6D6D6; color: #000;">
<div id="container" style="margin-top: 5px;">
    <header>
        <div class="container_12">
            <div class="grid_12 alpha" style="border: 1px solid #666;">
                <map name="auto_hutt" id="auto_hutt"><area shape="circle" coords="134,90,85" href="${resource(dir: '')}"  alt="" title="Zurück zur Startseite"></map>
                <r:img dir="images" file="auto_hutt_header_1000px.jpg" alt="Auto Hutt GmbH | 1a Autoservice" width="940" usemap="#auto_hutt" />
            </div>
        </div>
    </header>

    <div id="main" role="main">
        <div class="container_12">
            <div class="grid_3 alpha omega" id="naviDiv" style="width: 250px;">
                <div class="textcenter">
                    <img src="${resource(dir: 'images', file: 'menue_header.gif')}" alt="Auto Hutt GmbH | 1a Autoservice" style="margin-top: 10px;" />
                </div>

                <div>

                    <!--<br />-->
                    <h4 style="margin-top: 10px;">
                        Fahrzeugangebot:
                    </h4>

                </div>

                <ul>

                    <li>

                        <g:link controller="fahrzeug" action="lagerfahrzeuge">EU-Neufahrzeuge ab Lager Leingarten</g:link>

                    </li>

                    <li>

                        <a href="http://www.partner.apec-sales.de/index.php?parid=759&verify=209876302872759&p=1" target="_blank">EU-Neufahrzeuge ab Lager I</a>

                    </li>

                    <li>
                        <a href="http://webspace1.ssis.de/22658eln/-/fahrzeugangebote/124" target="_blank">EU-Neufahrzeuge ab Lager I, F, DK</a>

                    </li>

                    <li>

                        <a href="http://server7.autrado.de/vp-autohutt.de/" target="_blank">EU-Neufahrzeuge ab Lager NL</a>

                    <li>
                        <a href="http://webspace1.ssis.de/22658eln/-/fahrzeugangebote/2" target="_blank">EU-Bestellfahrzeuge</a>
                    </li>
                    <li>
                        <g:link controller="inhalt" action="bestellfahrzeuge">Deutsche Bestellfahrzeuge zu Top Konditionen</g:link>
                        %{--<a href="http://webspace1.ssis.de/22658eln/-/deutsche-bestellangebote.html" target="_blank">Deutsche Bestellfahrzeuge zu Top Konditionen</a>--}%
                    </li>
                    <li>
                        <a href="http://webspace1.ssis.de/22658eln/-/fahrzeugangebote/1" target="_blank">Nutzfahrzeuge</a>
                    </li>
                    <li>
                        <a href="http://webspace1.ssis.de/22658eln/-/fahrzeugangebote/124" target="_blank">Jahresfahrzeuge</a>
                        %{--<g:link controller="inhalt" action="jahresfahrzeuge">Jahresfahrzeuge</g:link>--}%
                    </li>

                    <li>
                        %{--<a href="http://webspace1.ssis.de/22658eln/-/fahrzeugangebote/124" target="_blank">Gebrauchtfahrzeuge</a>--}%
                        <g:link controller="inhalt" action="gebrauchtfahrzeuge">Gebrauchtfahrzeuge</g:link>
                    </li>

                </ul>

                <ul>

                    <div>

                        <h4>
                            Unser Service:
                        </h4>

                    </div>

                    <li>

                        <a href="http://www.dat.de/gebraucht.html" target="_blank">DAT Gebrauchtfahrzeugbewertung</a>

                    </li>

                    <li>

                        <a href="https://fibot.creditplus.de/fibot/frontend?startMask=MiniRechner&HNr=310460&kondition=pkwR01&anzahlung=ja&rsv=ja" target="_blank">Kreditrechner</a>
                        %{--<g:link controller="inhalt" action="kreditrechner">Kreditrechner</g:link>--}%

                    </li>

                    <li>

                        <g:link controller="inhalt" action="leistungen">Leistungen</g:link>

                    </li>

                    <li>

                        <a href="http://www.go1a.de/" target="_blank">Aktuelle Angebote</a>
                        %{--<g:link controller="inhalt" action="aktuelle_angebote">Aktuelle Angebote</g:link>--}%

                    </li>

                    <li>

                        <g:link controller="inhalt" action="hauptuntersuchung_au">Hauptuntersuchung &amp; AU</g:link>

                    </li>

                </ul>

                <div>

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
            <div class="grid_8 alpha" id="contentDiv" style="width: 655px;">
                <g:if test="${params.action == 'home'}">
                    <div id="addressDiv">
                        <g:render template="/layouts/address"/>
                    </div>
                </g:if>
                <g:layoutBody/>
            </div>
        </div>
    </div>
    <footer>

    </footer>
</div> <!--! end of #container -->
<r:layoutResources/>
<!--[if lt IE 7]>
<script type="text/javascript">
	DD_belatedPNG.fix('img, .png_bg'); // Fix any <img> or .png_bg bg-images. Also, please read goo.gl/mZiyb
</script>
<![endif]-->
</body>
</html>