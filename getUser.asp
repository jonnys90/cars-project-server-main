<%@ language="Vbscript"%>

<% 
Response.Codepage = 65001  'Forces ASP to use UTF-8 for string encoding
Response.Charset = "UTF-8" 'Sets charset variable of content type response header
Response.LCID = 1037 'Hebrew Locale ID

if TypeName(session("username")) = "Empty" then
    response.write "{error: """"no username""""}"
else
    'response.write(session("username"))
    response.write "{username: """ & session("username") & """}"
end if
 %>