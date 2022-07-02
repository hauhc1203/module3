<%--
  Created by IntelliJ IDEA.
  User: hauhc1203
  Date: 02/07/2022
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thêm Học Sinh</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        form{
            width: 500px;
            height:  auto;
            margin: auto;
            padding: 50px;
            border: 3px dotted red;
            position: relative;
    }
        select,input{
            width: 300px;
            height: auto;
        }
        h3   {
            text-align: center;

        }
        button{
            position: relative;
            left: 50%;
            transform: translateX(-50%);;
        }


    </style>
</head>
<body>
<form action="/student?action=create" method="post" >
    <h3>Thêm Học Sinh Mới</h3>
    <br>
    Tên Học Sinh<br>
    <input type="text" placeholder="nhập vào tên" name="name" required autofocus><br><br>
    Email<br>
    <input type="email" placeholder="nhập vào email" name="email" required><br><br>
    Ngày Sinh<br>
    <input type="text" placeholder="nhập vào ngày sinh yyyy-MM-dd" name="birthday" required><br><br>
    Địa chỉ <br>
    <input type="text" placeholder="nhập vào địa chỉ" name="diachi" required><br><br>
    Số điện thoại <br>
    <input type="tel" placeholder="nhập vào số điện thoại" name="sdt" required><br><br>
    Lớp <br>
    <select  name="malop">
        <c:forEach var="lop" items="${lops}">

            <option value="${lop.maLop}">
                    ${lop.tenLop}</option>
        </c:forEach>
    </select>
    <br><br>
    <button type="submit" class="btn btn-primary">Tạo</button>

</form>
</body>
</html>
