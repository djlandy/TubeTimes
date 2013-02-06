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
if pick = false then response.write "<Title>" + stn + " Tube Times</title>"
z=0
toshow=5


'stn = stn.replace(".", "")


response.write("<span style=""font-family: Arial"">")
'response.write("<p><b>")
response.write("<div id=""topbar"">")
        response.write("<div id=""leftnav"" onclick=""back();"">Back</div>")
response.Write("<div id=""title"">" + stn + "</div>")
response.write("<div id=""rightbutton"" onclick=""update();"">Refresh</div>")

response.Write("</diV>")
'response.write("</b>")
'response.write("<br></P>")
response.write("<div id=""content"">")
'response.write("<br>")
'response.write("<table><tr><th style=""text-align:left"">This Page =""" + ThisPage + """ </th></tr></table>")
'response.write("<br>")
q= x.length
'response.write("<table><tr><th style=""text-align:left"">" + l + "</th></tr></table><br>")
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
response.write("<div id=""footer""<span class=""noeffect"" style=""text-align:left"">Last Updated: " + t + "</span></div>") 
response.write("</span>")
response.write("</div>")
end if