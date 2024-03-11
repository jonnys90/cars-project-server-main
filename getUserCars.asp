<%@ language="Vbscript"%>
<% 
Response.Codepage = 65001  'Forces ASP to use UTF-8 for string encoding
Response.Charset = "UTF-8" 'Sets charset variable of content type response header
Response.LCID = 1037 'Hebrew Locale ID

Function convertUserCarsToJson(carsDictionary)
    dim r, rl, c, cl, str
    str = "["
    rl = carsDictionary.keys
    'Response.Write rl & "|"
    for r = 0 to UBound(rl)
        str = str & "{"
        str = str & rl(r)
        str = str & ":"
        str = str & carsDictionary.item(cstr(rl(r)))
        str = str & "},"
    next
    str = Left(str, Len(str) - 1) & "]"
    convertUserCarsToJson = str
end Function 

if TypeName(session("userCars")) <> "Empty" then
    Dim jsonTable
    jsonTable = convertUserCarsToJson(session("userCars"))
    Response.Write jsonTable
else
    Response.Write "[]"
end if
%>