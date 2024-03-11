 <%@ language="Vbscript"%>
 <% 
    If len(Session("LastSortOrder")) <= 0  Then
        ' Empty
        response.write("Empty")
    Else
        ' Not Empty
        response.write("Not Empty")
    End If
 %>
