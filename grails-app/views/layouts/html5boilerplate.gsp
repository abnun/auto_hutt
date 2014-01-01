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
	<r:script disposition="head">
		var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-7452991-1']);
	  _gaq.push(['_trackPageview']);

	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	</r:script>
    <r:layoutResources/>
</head>

<body style="background-color: #D6D6D6; color: #000;">
<div id="container">
    <header>
        <div class="container_12">
            <div class="grid_12" style="border: 1px solid #666;">
                <map name="auto_hutt" id="auto_hutt"><area shape="circle" coords="127,85,90" href="${createLink(uri: '/')}"  alt="" title="Zurück zur Startseite"></map>
                <r:img dir="images" file="auto_hutt_header_1000px.jpg" alt="Auto Hutt GmbH | 1a Autoservice" width="940" usemap="#auto_hutt" />
            </div>
        </div>
    </header>

    <div id="main" role="main">
        <div class="container_12">
            <div class="grid_12" style="border: 1px solid #4B4B49; background-color: #AAA7A7;">
                <div class="grid_4 alpha">
                    <div id="naviDiv">
                        <div class="textcenter">
                            <img src="${resource(dir: 'images', file: 'menue_header.gif')}"
                                 alt="Auto Hutt GmbH | 1a Autoservice" style="margin-top: 10px;"/>
                        </div>

                        <div>

                            <!--<br />-->
                            <h4 style="margin-top: 10px;">
                                Fahrzeugangebot:
                            </h4>

                        </div>

                        <nav:primary class="naviUl" scope="fahrzeugAngebot" custom="true">
                            <li>
                                <g:if test="${item.data.blank}">
                                    <a href="${p.callTag(tag: 'g:createLink', attrs: linkArgs + [class: active ? 'active' : ''])}" target="_blank">
                                        <nav:title item="${item}"/>
                                    </a>
                                </g:if>
                                <g:else>
                                    <p:callTag tag="g:link" attrs="${linkArgs + [class: active ? 'active' : '']}">
                                        <nav:title item="${item}"/>
                                    </p:callTag>
                                </g:else>
                            </li>
                        </nav:primary>

                        <div>

                            <h4>
                                Unser Service:
                            </h4>

                        </div>

                        <nav:primary class="naviUl" scope="service" custom="true">
                            <li>
                                <g:if test="${item.data.blank}">
                                    <a href="${p.callTag(tag: 'g:createLink', attrs: linkArgs + [class: active ? 'active' : ''])}" target="_blank">
                                        <nav:title item="${item}"/>
                                    </a>
                                </g:if>
                                <g:else>
                                    <p:callTag tag="g:link" attrs="${linkArgs + [class: active ? 'active' : '']}">
                                        <nav:title item="${item}"/>
                                    </p:callTag>
                                </g:else>
                            </li>
                        </nav:primary>

                        <div>

                            <h4>
                                Wie Sie uns erreichen:
                            </h4>

                        </div>

                        <nav:primary class="naviUl" scope="wie_sie_uns_erreichen" custom="true">
                            <li>
                                <g:if test="${item.data.blank}">
                                    <a href="${p.callTag(tag: 'g:createLink', attrs: linkArgs + [class: active ? 'active' : ''])}" target="_blank">
                                        <nav:title item="${item}"/>
                                    </a>
                                </g:if>
                                <g:else>
                                    <p:callTag tag="g:link" attrs="${linkArgs + [class: active ? 'active' : '']}">
                                        <nav:title item="${item}"/>
                                    </p:callTag>
                                </g:else>
                            </li>
                        </nav:primary>

                    </div>
                </div>
                <div class="grid_8 omega" id="contentDiv">
                    <g:layoutBody/>
                </div>
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