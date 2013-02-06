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
    
response.write("<section class=""container"">")    

response.write("<div id=""main"">")
response.write("<div class=""front"">")
    response.write("<span style=""font-family: Arial"">")
   
    response.write("<div id=""topbar"">")
response.Write("<div id=""title"">Select a Station</div>")


        'response.write("<div id=""rightbutton""> <a href=""javascript:aboutJQ();"">About</a></div>")
        response.write("<div id=""rightbutton"" onclick=""about();"">About</div>")
        
        
        response.Write("</diV>")
        response.write("<div id=""picker"">")
        response.write("<b>")
    response.write("<table><tr><th style=""text-align:left;"">Select Line</th></tr></table>")
	response.write("</b>")
    'response.write("<table><tr><th style=""text-align:left"">")
    response.write("<ul class=""pageitem""><li class=""select""> <select id=""line"" onchange=""gettimes2()"">")
    
    if (lns = 0 or l = "") then
        response.write ("<option value="""" selected=""selected"" >Select Line</option>")
        
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
    response.write("</select><span class=""arrow""></span> </li></ul>")
    'response.write("</th></tr></table>")
    response.write("<br>")
    response.write("<b>")
	response.write("<table><tr><th style=""text-align:left"">Select Station</th></tr></table>")
	response.write("</b>")
    'response.write("<table><tr><th style=""text-align:left"">")
    response.write("<div id=""stationpicker"">")    
        stationbox = getMappedFileAsString("includes/station.asp")
        
        execute stationbox
    response.write("</div>")

    'response.write("</th></tr></table>")
    response.write("<table><tr><th style=""text-align:left"">")
    response.write("<ul class=""pageitem""><li class=""button""><input name=""Submit input"" type=""submit"" value=""Get Trains"" onclick=""gettimes2()"" /></li></ul>")
        if debugmode = true then 
        response.write("<ul class=""pageitem""><li class=""button""><input name=""Spinner Test"" type=""submit"" value=""Show"" onclick=""showspinner()"" /></li></ul>")
        response.write("<ul class=""pageitem""><li class=""button""><input name=""Flip Test"" type=""submit"" value=""Flip"" onclick=""flip()"" /></li></ul>")
        end if
    response.write("</th></tr></table>")
    response.write("</div>")
    
    response.write("</div>")
    response.write("<div class=""back"" id=""back"">")
    
            response.write("</div>")
    response.write("</div>")
    response.write("</section>")
    
   
