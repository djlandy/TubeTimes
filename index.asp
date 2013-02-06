<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

    <!--#include file = "includes/dynamicincludes.asp" -->

<% 
 debugmode = true
 s = Request.QueryString("s")
 l = Request.QueryString("l")
if (l="" or s="") then pick=true else pick=false    %>
<head>
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <!--<% if pick = false then response.Write "<meta http-equiv=""refresh"" content=""30""/>"%>-->


    <link href="css/style.css" rel="stylesheet" media="screen" type="text/css" />
    <link href="css/styles.css" rel="stylesheet" media="screen" type="text/css" />
    <link href="css/tablestyle.css" rel="stylesheet" media="screen" type="text/css" />
    <link href="css/msgbox.css" rel="stylesheet" media="screen" type="text/css" />
    <link href="css/jquery.alerts.css" rel="stylesheet" media="screen" type="text/css" />
    <link href="css/spinner.css" rel="stylesheet" media="screen" type="text/css" />
    <link href="css/flip.css" rel="stylesheet" media="screen" type="text/css" />
    <link rel="apple-touch-icon" href="icons/tt.png" />
    <% if pick = true then 
            response.write("<link rel=""apple-touch-startup-image"" href=""icons/pick.png"">")
        else
            response.write("<link rel=""apple-touch-startup-image"" href=""icons/show.png"">")
        end if
        %>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js" type="text/javascript"></script>
    <script src="javascript/functions.js" type="text/javascript"></script>
    <script src="javascript/reload.js" type="text/javascript"></script>
    <script src="javascript/jquery.alerts.js" type="text/javascript"></script>
    <script src="javascript/modal.js" type="text/javascript"></script>
    <script src="javascript/spinner.js" type="text/javascript"></script>
    <% if pick = true then response.write "<Title>Tube Times</title>"%>
</head>
<body>

    <% 
    s = Request.QueryString("s")
    l = Request.QueryString("l")
    Thispage ="http://" & Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("URL")
    thispage = replace(thispage, "/index.asp", "")
    'url = "http://" & Request.ServerVariables("SERVER_NAME") & "/tubetimes/feedz.asp?l=" & l & "&s=" & s
    url = thispage & "/feedz.asp?l=" & l & "&s=" & s

 if pick = true then
 includestr = getMappedFileAsString("includes/pick.asp")
else
includestr=getMappedFileAsString("includes/show.asp")

end if    
execute includestr        
'response.write (includestr)
    %>
</body>
</html>

