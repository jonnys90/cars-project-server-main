 <%@ language="Vbscript"%>
 <!--#include file="jsonObject.class.asp"--> 
<% 
Response.LCID = 1046
set JSON = New JSONobject
JSON.Add "prop1", "someString"
JSON.Add "prop2", 12.3
JSON.Add "prop3", Array(1, 2, "three")

Response.Write JSON("prop3").Serialize() & "<br>"
%>