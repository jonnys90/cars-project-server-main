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
    for i=0 to UBound(filter1) - 1
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
function buyNewCars(carsToDelete)
    dim i, itemsToDelete, idToDelete, quantityToRemove, seccessCounter
    dim cars, userCars
    set cars = session("db")
    set userCars = session("userCars")
    itemsToDelete = carsToDelete.keys
    seccessCounter = 0
    for i=0 to UBound(itemsToDelete)
        idToDelete = carsToDelete.item(itemsToDelete(i)).item("id")
        quantityToRemove = cint(carsToDelete.item(itemsToDelete(i)).item("quantity"))
        if(cars.exists(idToDelete) and cint(cars.item(idToDelete).item("quantity")) >= quantityToRemove) then
            cars.item(idToDelete).item("quantity") = cars.item(idToDelete).item("quantity") - quantityToRemove
            if(userCars.exists(idToDelete) = false) then
                userCars.add idToDelete, 0
            end if
            userCars.item(idToDelete) = cint(userCars.item(idToDelete)) + cint(quantityToRemove)
            seccessCounter = seccessCounter + 1
        end if 
    next
    set session("db") = cars
    set session("userCars") = userCars
    removeCars = seccessCounter
end function

dim seccessCounter

set carsToDelete = parseJson(request.form("cars"))
seccessCounter = buyNewCars(carsToDelete)

response.write "{""status"":""success"",""carsTransffered"":" & seccessCounter & "}"
%>
