 
 response.write("<ul class=""pageitem""><li class=""select""> <select id=""station"">")
   
        response.write(sns)
    if (l = "" or sns = 0) then
        response.write("<option value="""" selected=""selected""></option>")
        response.write("<option value="""">Select a Line</option>")
    else
        response.write ("<option value="""" selected=""selected"" ></option>")
        for r = 0 to sns - 1 
        stationcode = stations(r).getattribute("Code")
        response.write("<option value=" + stationcode + ">" + Stations(r).getattribute("N") + "</option>")
        next
    end if
    response.write("</select><span class=""arrow""></span> </li></ul>")
    