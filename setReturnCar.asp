<%@ language="Vbscript"%>
<!--#include file="helpers/initData.asp"-->
<!--#include file="helpers/authGuard.asp"-->
<% 
'add hebrew support
Response.Codepage = 65001  'Forces ASP to use UTF-8 for string encoding
Response.Charset = "UTF-8" 'Sets charset variable of content type response header
Response.LCID = 1037 'Hebrew Locale ID

'method: POST'
'will request car id'
'will return the cars to mail db'
'will response with status ok or error with error message'

function setReturnCar()
	if TypeName(session("db")) = "Empty" then
		response.write "{""error"": ""cars database empty""}"
		exit function
	end if
	if TypeName(session("userCars")) = "Empty" or session("userCars").count = 0 then
		response.write "{""error"": ""user did not select any cars""}"
		exit function
	end if
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
			response.write "{""status"": ""ok""}"
		else
			response.write "{""error"": ""please provide a valid id""}"
		end if
	else
		response.write "{""error"": ""please provide a number""}"
	end if
end function
setReturnCar()

 %>