<html>
    <head>
        <meta name="layout" content="html5boilerplate" />

		<style type="text/css">

		/* ... file-local CSS props ... */

		#address {
			padding-top: 10px;
			float: right;
		}

		#address a:link,
			#addressDiv a:visited {
			color: #666;
			font-size: 80%;
		}

		#address a:focus,
			#address a:hover,
			#address a:active {
			color: #000;
			font-size: 80%;
		}

		</style>
	</head>

    <body>

        <div class="body">
            <h1>
                Was k&ouml;nnen wir f&uuml;r Sie tun?
            </h1>

            <br />

            <div class="textcenter" style="width: 620px">

                <div class="textleft" style="float: left;">
                    <div class="textcenter">
                        Unser Service &amp; Verkaufsteam
                    </div>
                    <br/>
                    <img src="${resource(dir: 'images', file: 'team.jpg')}" alt="Team"/>
                </div>

              <div id="address" style="text-align: left; width: 260px;">
                <g:render template="/layouts/address"/>
              </div>

            </div>

            <div style="clear: both;"></div>

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