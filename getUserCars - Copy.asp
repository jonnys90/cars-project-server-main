<%@ language="Vbscript"%>
<!--#include file="helpers/initData.asp"-->
<!--#include file="helpers/authGuard.asp"-->
<% 
Response.Codepage = 65001  'Forces ASP to use UTF-8 for string encoding
Response.Charset = "UTF-8" 'Sets charset variable of content type response header
Response.LCID = 1037 'Hebrew Locale ID

'method:GET'
'will responde with all cars that user has'

'convert users car dictionary to json'
Function convertUserCarsToJson(carsDictionary)
    dim r, rl, c, cl, str
    str = "["
    rl = carsDictionary.keys
    for r = 0 to UBound(rl)
        str = str & "{"
        str = str & rl(r)
        str = str & ":"
        str = str & carsDictionary.item(cstr(rl(r)))
        str = str & "},"
    next
    str = Left(str, Len(str) - 1)
    if Len(str) = 0 then
        str = "["
    end if
    convertUserCarsToJson = str & "]"
end Function 


if TypeName(session("userCars")) <> "Empty" then
    Dim jsonTable
    jsonTable = convertUserCarsToJson(session("userCars"))
    Response.Write jsonTable
else
    response.write "{""error"": ""user not logged in""}"
end if

%>