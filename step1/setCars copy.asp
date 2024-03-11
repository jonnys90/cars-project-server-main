 <%@ language="Vbscript"%>
<% 
Response.Codepage = 65001  'Forces ASP to use UTF-8 for string encoding
Response.Charset = "UTF-8" 'Sets charset variable of content type response header
Response.LCID = 1037 'Hebrew Locale ID

function parseJson(json)
    dim i, str, r, c, rl, cl
    dim cars
    set cars = server.createObject("Scripting.Dictionary")
    r = 0
    c = 0
    cars.add "0", server.createObject("Scripting.Dictionary")
    str = ""
    for i=2 to len(json)-1
        if mid(json, i, 1) <> "," and mid(json, i, 1) <> "[" and mid(json, i, 1) <> "]" and mid(json, i, 1) <> """" then
            str = str & mid(json, i, 1)
        end if
        if mid(json, i, 1) = "," and str <> "" then
            cars.item(cstr(r)).add cstr(c), str
            str = ""
            c = c + 1
        end if
        if mid(json, i, 1) = "]" then
            cars.item(cstr(r)).add cstr(c), str
            str = ""
            c = 0
            r = r + 1
            cars.add cstr(r), server.createObject("Scripting.Dictionary")
        end if
    next
    session("db") = cars
end function
parseJson(request.form("cars"))
'set cars = JSON.parse(request.form("cars"))
'reDim cars(1)
'cars(0) = "Volvo"
'redim Preserve  cars(2)
'cars(1) = "BMW"
'response.write cars(0)
%>