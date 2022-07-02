<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<form action="/product?action=${acction}" method="post" style="width: 500px;height: auto ;text-align: center;border: 1px solid black;margin: auto">
<%--    <%  String a= (String) request.getAttribute("acction");--%>
<%--//        if (a.equals("create")) {--%>
<%--//--%>
<%--//        }--%>
<%--    %>--%>
    <h1>Thông tin sản phẩm</h1>
    Id: <input type="number" placeholder="Nhap vao ID" name="id"><br><br>

    Product Name:<input type="text" placeholder="Nhap vao ten sp" name="pname"><br><br>
    Product Price:<input type="text" placeholder="Nhap vao gia sp" name="pprice"><br><br>
    Product Image:<input type="text" placeholder="Nhap vao link anh sp" name="img"><br><br>

    <button type="submit" class="btn btn-primary">Create</button></form>

</body>
</html>