<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv='refresh'   content='0;url=<%=basePath%>main'>
    <title>loading</title>
</head>
<body>

</body>
</html>