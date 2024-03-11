 <%@ language="Vbscript"%>
 <!--#include file="jsonObject.class.asp"--> 
<% 
Response.LCID = 1046
set JSON = New JSONobject
JSON.Add "prop1", "someString"
JSON.Add "prop2", 12.3
JSON.Add "prop3", Array(1, 2, "three")

Response.Write JSON.Value("prop1") & "<br>"
Response.Write JSON.Value("prop2") & "<br>"
Response.Write JSON("prop3")(0) & "<br>" ' default function is equivalent to `.Value(propName)` - this property returns a JSONarray object

%>