 <%@ language="Vbscript"%>
<% 
Response.Codepage = 65001  'Forces ASP to use UTF-8 for string encoding
Response.Charset = "UTF-8" 'Sets charset variable of content type response header
Response.LCID = 1037 'Hebrew Locale ID

sub initWanabidb()
    Dim table(4,3)
    if TypeName(session("db")) = "Empty" then
        table(0,0)=1
        table(0,1)="Mazda"
        table(0,2)=1

        table(1,0)=2
        table(1,1)="Kia"
        table(1,2)=2

        table(2,0)=3
        table(2,1)="Shevrolet"
        table(2,2)=3

        table(3,0)=4
        table(3,1)="Diatzu"
        table(3,2)=4
        session("db") = table
    end if
end sub
call initWanabidb()

Function convertTableToJson(table)
   Dim i,j, json, arrLen, arrItem
   json = ""
   arrLen = UBound(table)
   arrLen = arrLen - 1
   arrItem = UBound(table,2)
   arrItem = arrLen - 1
   for i=0 to arrLen
        json = json & "["
        for j=0 to arrItem
            json = json & """" & table(i,j) & """" & ","
        next
        json = left(json, len(json)-1) & "],"
   next
   json = left(json, len(json)-1)
   convertTableToJson = "[" & json & "]"
end Function 

Dim jsonTable
jsonTable = convertTableToJson(session("db"))
Response.Write convertTableToJson(session("db"))
%>