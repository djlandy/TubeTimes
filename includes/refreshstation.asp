<!--#include file = "dynamicincludes.asp" -->

<% l=request.QueryString("l")
    Thispage ="http://" & Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("URL")
    thispage = replace(thispage, "includes/refreshstation.asp", "")
        
    set xmldoc = CreateObject("MSXML2.ServerXMLHTTP")
    xmldoc.open "GET", thispage + "stations.xml", false
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
     
     stationbox = getMappedFileAsString("station.asp")
        
        execute stationbox%>
