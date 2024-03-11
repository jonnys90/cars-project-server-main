 <%@ language="Vbscript"%>
 <!--#include file="jsonObject.class.asp"--> 
<% 
Response.Codepage = 65001  'Forces ASP to use UTF-8 for string encoding
Response.Charset = "UTF-8" 'Sets charset variable of content type response header
Response.LCID = 1037 'Hebrew Locale ID

set JSON = New JSONobject

if TypeName(session("username")) = "Empty" then
    JSON.add "error", "no username"
    'response.write("no username")
else
    JSON.add "username", session("username")
    'response.write(session("username"))
end if
response.write JSON.Serialize()
%>