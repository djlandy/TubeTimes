<!DOCTYPE html>

<html>

<head>
    <title>Tube Times</title>

    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- jQuery Mobile js and CSS -->

    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.0-rc.1/jquery.mobile-1.3.0-rc.1.min.css" />
    <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.3.0-rc.1/jquery.mobile-1.3.0-rc.1.min.js"></script>

    <!-- Custom js -->

    <script src="js/functions.js"></script>
    <link rel="stylesheet" href="css/table-style.css" />

    <link rel="apple-touch-icon" href="icons/tt.png" />


</head>

<body>
    <div data-role="page" id="show">

        <div data-role="header" data-position="fixed">
            <a href="index.asp" data-icon="back" data-direction="reverse" data-transition="slide">Back</a>
            <h1>Tube Times</h1>
            <a href="javascript:reloadpage()" data-icon="refresh" class="ui-btn-right">Refresh</a>
        </div>
        <div data-role="content">
            <%


    s = Request.QueryString("s")
    l = Request.QueryString("l")
    Thispage ="http://" & Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("URL")
    thispage = replace(thispage, "/showtimes.asp", "")
    'url = "http://" & Request.ServerVariables("SERVER_NAME") & "/tubetimes/feedz.asp?l=" & l & "&s=" & s
    url = thispage & "/feedz.asp?l=" & l & "&s=" & s


set xmldoc = CreateObject("MSXML2.ServerXMLHTTP") 
    xmldoc.open "GET", url, false 
    xmldoc.send "" 
'set doc = createobjectxmldocument
'doc = xmldoc        
set xmlResponse=xmldoc.responseXML

if xmldoc.responsetext = "" then
        response.write"Error getting data from TFL"
else
l=xmlresponse.getElementsByTagName("LineName")(0).childNodes(0).nodeValue
t=xmlresponse.getElementsByTagName("WhenCreated")(0).childNodes(0).nodeValue
set y=xmlresponse.getElementsByTagName("S")

'y=xmlDoc.selectnodes("S")
set x=xmlResponse.getElementsByTagName("P")
'x=xmlDoc.selectnodes("P")
stn=y(0).getAttribute("N")
stn = replace(stn, ".","")

z=0
toshow=5


'stn = stn.replace(".", "")

q= x.length

for i=0 to (q -1)
    response.write("<b>")
	response.write("<table><tr><th style=""text-align:left"">" + x(i).getAttribute("N") + "</th></tr></table>")
	response.write("</b>")
   response.write("<br>")
	response.write("<table class=""bordered"">")
	response.write("<tr><th width=""5%"">Due</th><th width=auto>Current Location</th><th width=""30%"">Destination</th>")
	if (x(i).getElementsByTagName("T").length <  toshow) then
	    z=x(i).getElementsByTagName("T").length
	else
		z=toshow
	end if
   		'response.write (z)
	for n=0 to (z - 1)
		response.write("<tr><td>")
		response.write(x(i).getElementsByTagName("T")(n).getAttribute("TimeTo"))
  		response.write("</td><td>")
		response.write(x(i).getElementsByTagName("T")(n).getAttribute("Location"))
  		response.write("</td><td>")
  		response.write(x(i).getElementsByTagName("T")(n).getAttribute("Destination"))
    		response.write("</td></tr>")
	next	
	response.write("</table>")
	response.write("<br>")
	 
next
response.write("</div>")
response.write("<div data-role=""footer"" data-position=""fixed"" data-id=""FixedFooter""><h4>")
response.write("Last Updated: " + t ) 
response.write("</h4></div>")

end if

            %>
        </div>

    </div>

</body>
</html>
