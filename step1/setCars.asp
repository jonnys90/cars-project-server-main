 <%@ language="Vbscript"%>
<% 
Response.Codepage = 65001  'Forces ASP to use UTF-8 for string encoding
Response.Charset = "UTF-8" 'Sets charset variable of content type response header
Response.LCID = 1037 'Hebrew Locale ID

function parseJson(json)
    dim filter1, filterLine, filterCell, line
    dim i, j, k, r
    dim cars
    set cars = server.createObject("Scripting.Dictionary")
    r = 1
    line = Right(Left(json, Len(json) - 1), Len(json) - 2)
    line = replace(line, """", "")
    line = replace(line, "{", "")
    filter1 = split(line, "}")
    for i=0 to UBound(filter1)
        filterLine = split(filter1(i), ",")
        cars.add cstr(r), server.createObject("Scripting.Dictionary")
        for j=0 to UBound(filterLine)
            filterCell = split(filterLine(j), ":")
            if(UBound(filterCell) >= 1) then
                cars.item(cstr(r)).add filterCell(0), filterCell(1)
            end if
        next
        r = r + 1
    next
    set parseJson = cars
end function
set session("db") = parseJson(request.form("cars"))
response.write "{""status"":""success""}"
%>
