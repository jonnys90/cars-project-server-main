<%
Function convertTableToJson(carsDictionary)
    dim r, rl, c, cl, str
    str = "["
    rl = carsDictionary.count
    for r = 1 to rl
        cl = carsDictionary.item(cstr(r)).Keys
        str = str & "{"
        for c = 0 to UBound(cl)
            str = str & """" & cl(c) & """" & ":"
            str = str & """" & carsDictionary.item(cstr(r)).item(cl(c)) & """" & ","
        next
        str = Left(str, Len(str) - 1)
        str = str & "},"
    next
    str = Left(str, Len(str) - 1) & "]"
    convertTableToJson = str
end Function 

%>