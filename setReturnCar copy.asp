<%@ language="Vbscript"%>

<% 
'add hebrew support
Response.Codepage = 65001  'Forces ASP to use UTF-8 for string encoding
Response.Charset = "UTF-8" 'Sets charset variable of content type response header
Response.LCID = 1037 'Hebrew Locale ID

'method: POST'
'will request car id'
'will return the cars to mail db'
'will response with status ok or error with error message'

if TypeName(session("db")) = "Empty" or TypeName(session("userCars")) = "Empty" then
    response.write "{error: """"database or user cars""""}"
else
	dim userCars, cars, carId, carQuantity
	set userCars = session("userCars")
	set cars = session("db")
	if(isnumeric(request.form("carId"))) then
		carId = cint(request.form("carId"))
		if(userCars.exists(cstr(carId))) then
			carQuantity = cint(userCars.item(cstr(carId)))
			cars.item(cstr(carId)).item("quantity") = cint(cars.item(cstr(carId)).item("quantity")) + carQuantity
			userCars.remove(cstr(carId))
			set session("userCars") = userCars
			set session("db") = cars
			response.write "{status: ""ok""}"
		else
			response.write "{error: ""please provide a valid id""}"
		end if
	else
		response.write "{error: ""please provide a number""}"
	end if
end if

 %>