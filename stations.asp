<% 
   
    l = Request.QueryString("l")
     
    Thispage ="http://" & Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("URL")
    thispage = replace(thispage, "/stations.asp", "")
    'url = "http://" & Request.ServerVariables("SERVER_NAME") & "/tubetimes/feedz.asp?l=" & l & "&s=" & s
    

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
    response.write("<option value="""" selected=""selected"" data-placeholder=""true"">Select a Station</option>") 
    
    for r = 0 to sns - 1 
        stationcode = stations(r).getattribute("Code")
        response.write("<option value=" + stationcode + ">" + Stations(r).getattribute("N") + "</option>")
    next

%>