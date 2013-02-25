<!DOCTYPE html>

<html>



<% 
 debugmode = true
 s = Request.QueryString("s")
 l = Request.QueryString("l")
if (l="" or s="") then pick=true else pick=false    %>

<head>
    <title>Tube Times</title>

    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- jQuery Mobile js and CSS -->

    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.0/jquery.mobile-1.3.0.min.css" />
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.3.0/jquery.mobile-1.3.0.min.js"></script>

    <!-- Custom js and css-->

    <script src="js/functions.js"></script>
    <link rel="stylesheet" href="css/table-style.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <link rel="apple-touch-icon" href="icons/tt.png" />


</head>
<body>

    <% 
    s = Request.QueryString("s")
    l = Request.QueryString("l")
    Thispage ="http://" & Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("URL")
    thispage = replace(thispage, "/index.asp", "")
    'url = "http://" & Request.ServerVariables("SERVER_NAME") & "/tubetimes/feedz.asp?l=" & l & "&s=" & s
    url = thispage & "/feedz.asp?l=" & l & "&s=" & s

   

    set xmldoc = CreateObject("MSXML2.ServerXMLHTTP")
    xmldoc.open "GET", thispage + "/stations.xml", false
    xmldoc.send ""
    set xmlResponse=xmldoc.responseXML
    set lines=xmlResponse.getElementsByTagName("L")
    ls = lines.length
    for r = 0 to ls -1
        
        if lines(r).getattribute("Code") = l then
            set stations=lines(r).getelementsbytagname("S")
            sns = stations.length
        end if
    next
    %>
    <div data-role="page" id="picker">

        <div data-role="header" data-position="fixed">
            <h1>Tube Times</h1>
            

        </div>
        <div data-role="content">
            <label for="line-pick" class="select"><b>Line</b></label>
            <select name="line-pick" id="line-pick" data-native-menu="false" onchange="getstations()">

                <%    
    if (lns = 0 or l = "") then
        response.write ("<option value="""" selected=""selected"" data-placeholder=""true"">Select Line</option>")
        
    else
        response.write ("<option value=""""></option>")
    end if

    for r = 0 to ls -1
        linecode = lines(r).getAttribute("Code")
        if strcomp(linecode, l, 1) = 0 then 
            response.write ("<option value=" + linecode + " selected=""selected"" >" + lines(r).getattribute("N") + "</option>")
        else
            response.write ("<option value=" + linecode + ">" + lines(r).getattribute("N") + "</option>")
        end if
        'response.write("<option value=""P"">Picadilly Line</option>")
    next
                %>
            </select>

            <br />
            <label for="station-pick" class="select"><b>Station</b></label>
            <select name="station-pick" id="station-pick" data-native-menu="false" disabled="true" onchange="changestation()">
                <!-- Code to render the station box if query string is used, to enable browers with no script -->

                <%
                %>
            </select>
            <br />

            <input type="submit" value="Get Trains!" onclick="changepage()" disabled="true" id="gettrains" name="gettrains">
        </div>

        <div data-role="footer" data-position="fixed" data-id="FixedFooter">
            <h4></h4>
        </div>


    </div>

</body>
</html>

