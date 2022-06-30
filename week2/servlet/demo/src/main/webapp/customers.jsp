<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hauhc1203
  Date: 29/06/2022
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.KH"  %>
<%@ page import="java.util.ArrayList"  %>


<html>
<head>
    <title>Danh Sach Khach Hang</title>
    <style>
        img{
            width: 120px;
            height: 70px;
        }
        tr,th,td,table{
            border: 1px solid black;
            border-collapse: collapse;
        }
        table{
            width: 500px;
            height: auto;
            text-align: center;
            margin: auto;
        }
    </style>
</head>
<body>
<%
            ArrayList<KH> customers=new ArrayList<>();
            customers.add(new KH("Hoang Cong Hau","12/3/1998","Ha Noi","https://bloganh.net/wp-content/uploads/2021/03/chup-anh-dep-anh-sang-min.jpg"));
            customers.add(new KH("Pham Dinh The","1/4/2002","Nam Dinh","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQarPjVmZr9jgP4gVcnI9AV6Pcs3vTlXn02rwiWa3_uIg-0ljUkcHjlOfZhRjKqrqz9hko&usqp=CAU"));
            customers.add(new KH("Nguyen Van Duc","08/05/1995","Ha Nam","data:image/jpeg;base64,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"));
            customers.add(new KH("Hoang Cong Hai","1/6/1996","Phu Tho","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh09PSjWSrVzMpe7KZ4T-zvUQuL9SSZfUh0Q&usqp=CAU"));
            customers.add(new KH("Nguyen Tung Duong","25/12/2002","Ha Noi","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-Wos4bdeGUaZGT7UheknVFgNon_JMq0c-FF0HsaknRg-Bi-LEgg6cbchHIiZigY7x6Ik&usqp=CAU"));
            request.setAttribute("customers",customers);
%>

<table>
    <tr>
        <th>Name</th>
        <th>Birth Day</th>
        <th>Address</th>
        <th>Image</th>
    </tr>
    <c:forEach var = "cus" items="${customers}">
        <tr>
            <td>
                ${cus.name}
            </td>
            <td>
                    ${cus.birthday}
            </td>
            <td>
                    ${cus.address}
            </td>
            <td>
                <img src="${cus.imageURL}">
            </td>
        </tr>
    </c:forEach>

</table>


</body>
</html>
