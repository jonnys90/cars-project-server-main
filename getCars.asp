<%@ language="Vbscript"%>
<!--#include file="convertCarsDictionartToJSON.asp"-->
<!--#include file="initData.asp"-->
<% 
Response.Codepage = 65001  'Forces ASP to use UTF-8 for string encoding
Response.Charset = "UTF-8" 'Sets charset variable of content type response header
Response.LCID = 1037 'Hebrew Locale ID

'method:GET'
'description: this page should response with all cars for the user to buy'

Dim jsonTable

if TypeName(session("username")) = "Empty" then
    response.write "{error: ""user not logged in""}"
else
    if TypeName(session("db")) = "Empty" then
        response.write "{error: ""no cars""}"
    else
        jsonTable = convertCarsDictionartToJSON(session("db"))
        Response.Write jsonTable
    end if
end if
%>