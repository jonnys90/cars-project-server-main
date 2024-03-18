<%@ language="Vbscript"%>
<!--#include file="helpers/initData.asp"-->
<% 
'add hebrew support'
Response.Codepage = 65001  'Forces ASP to use UTF-8 for string encoding
Response.Charset = "UTF-8" 'Sets charset variable of content type response header
Response.LCID = 1037 'Hebrew Locale ID



'method:POST'
'check if the user exists in the "db" and response with status ok'
'else response with error user not exists'

if request.form("username") = "Shlomo" then
    session("username") = request.form("username")
    response.write "{""status"":""ok""}"
else
    response.write "{""error"":""user not exists""}"
end if
%>