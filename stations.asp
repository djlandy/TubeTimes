<%
    response.ContentType = "text/xml"
	
    ' Create an ASP XML parser object
    set xml0 = Server.CreateObject("Chilkat.Xml")

    ' Returns the XML page as a Variant
    set xml = xml0.HttpGet("http://www.xml-parser.com/companies.xml")

    ' Sort the company records by name.
    ascending = True
    xml.SortRecordsByContent "name", ascending

    ' Sort the fields within each company record by the field name.
    b = xml.FirstChild2()
    While b
        xml.SortByTag ascending
        b = xml.NextSibling2()
    Wend

    ' Navigate back to the root.
    xml.GetRoot2()

    response.write xml.GetXml()
%>


