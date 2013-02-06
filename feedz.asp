<% 
    s = Request.QueryString("s")
    l = Request.QueryString("l")
    url = "http://cloud.tfl.gov.uk/TrackerNet/predictiondetailed/" & l & "/" & s
    set xmlhttp = CreateObject("MSXML2.ServerXMLHTTP") 
    xmlhttp.open "GET", url, false 
    xmlhttp.send "" 
    response.ContentType="text/XML"
    Response.write xmlhttp.responseText 
    set xmlhttp = nothing 
%>