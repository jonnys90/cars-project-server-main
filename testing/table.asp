 <%@ language="Vbscript"%>
 <!--#include file="jsonObject.class.asp"--> 
<% 
Response.Codepage = 65001  'Forces ASP to use UTF-8 for string encoding
Response.Charset = "UTF-8" 'Sets charset variable of content type response header
Response.LCID = 1037 'Hebrew Locale ID

set JSON = New JSONobject

sub initWanabidb()
    Dim table(4,3)
    if TypeName(session("db")) = "Empty" then
        table(0,0)=1
        table(0,1)="מאזדה"
        table(0,2)=1

        table(1,0)=2
        table(1,1)="קיה"
        table(1,2)=2

        table(2,0)=3
        table(2,1)="שברולט"
        table(2,2)=3

        table(3,0)=4
        table(3,1)="דייהטסו"
        table(3,2)=4
        session("db") = table
    end if
end sub
call initWanabidb()

JSON.Add "table", session("db")

Response.Write JSON("table").Serialize()



%>