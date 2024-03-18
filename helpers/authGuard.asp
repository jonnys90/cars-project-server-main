<% 
if TypeName(session("username")) = "Empty" then
    response.write "{""error"": ""user not logged in""}"
    Response.End 
end if
 %> 