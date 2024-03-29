 <%@ language="Vbscript"%>
<% 
Response.Codepage = 65001  'Forces ASP to use UTF-8 for string encoding
Response.Charset = "UTF-8" 'Sets charset variable of content type response header
Response.LCID = 1037 'Hebrew Locale ID

sub initUserCars()
    dim cars
    'if TypeName(session("userCars")) = "Empty" then
        set cars = server.createObject("Scripting.Dictionary")
        set session("userCars") = cars
    'end if
end sub

sub initWanabidb()
    dim cars
    'if TypeName(session("db")) = "Empty" then
        set cars = server.createObject("Scripting.Dictionary")
        cars.add "1", server.createObject("Scripting.Dictionary")
        cars.Item("1").add "id", 1
        cars.Item("1").add "carName", "Mazda"
        cars.Item("1").add "quantity", 1

        cars.add "2", server.createObject("Scripting.Dictionary")
        cars.Item("2").add "id", 2
        cars.Item("2").add "carName", "Kia"
        cars.Item("2").add "quantity", 2

        cars.add "3", server.createObject("Scripting.Dictionary")
        cars.Item("3").add "id", 3
        cars.Item("3").add "carName", "Shevrolet"
        cars.Item("3").add "quantity", 3

        cars.add "4", server.createObject("Scripting.Dictionary")
        cars.Item("4").add "id", 4
        cars.Item("4").add "carName", "Diatzu"
        cars.Item("4").add "quantity", 4
        set session("db") = cars
    'end if
end sub
call initUserCars()
call initWanabidb()

Function convertCarsDictionartToJSON(carsDictionary)
    dim r, rl, c, cl, str
    str = "["
    rl = carsDictionary.count
    for r = 1 to rl
        cl = carsDictionary.item(cstr(r)).Keys
        str = str & "{"
        for c = 0 to UBound(cl)
            str = str & """" & cl(c) & """" & ":"
            str = str & """" & carsDictionary.item(cstr(r)).item(cl(c)) & """" & ","
        next
        str = Left(str, Len(str) - 1)
        str = str & "},"
    next
    str = Left(str, Len(str) - 3) & "]"
    convertCarsDictionartToJSON = str
end Function 

Dim jsonTable
jsonTable = convertCarsDictionartToJSON(session("db"))
Response.Write jsonTable
%>