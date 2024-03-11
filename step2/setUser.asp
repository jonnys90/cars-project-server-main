 <%@ language="Vbscript"%>
 <!--#include file="jsonObject.class.asp"--> 
<% 
Response.Codepage = 65001  'Forces ASP to use UTF-8 for string encoding
Response.Charset = "UTF-8" 'Sets charset variable of content type response header
Response.LCID = 1037 'Hebrew Locale ID
set JSON = New JSONobject
session("username") = request.form("username")
JSON.add "status", "ok"
response.write JSON.Serialize()
%>