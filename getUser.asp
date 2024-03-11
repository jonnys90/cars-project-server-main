<%@ language="Vbscript"%>

<% 
Response.Codepage = 65001  'Forces ASP to use UTF-8 for string encoding
Response.Charset = "UTF-8" 'Sets charset variable of content type response header
Response.LCID = 1037 'Hebrew Locale ID

'method:GET'
'will return the username that currently logged in'
'so we can display it on the page'

if TypeName(session("username")) = "Empty" then
    response.write "{error: """"no username""""}"
else
    response.write "{username: """ & session("username") & """}"
end if
 %> 