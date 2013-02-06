<%
  Function getMappedFileAsString(byVal strFilename)
  Const ForReading = 1

  Dim fso
  Set fso = Server.CreateObject("Scripting.FilesystemObject")
  
  Dim ts
  Set ts = fso.OpenTextFile(Server.MapPath(strFilename), ForReading)

  getMappedFileAsString = ts.ReadAll
  ts.close
  
  Set ts = nothing
  Set fso = Nothing
End Function %>