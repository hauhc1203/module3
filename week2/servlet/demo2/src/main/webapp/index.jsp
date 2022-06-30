<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<div style="width: 500px;margin: auto">
    <h1 style="text-align: center"><%= "Xin chao!" %></h1>
    <br/>
    <a href="/login" style="    display: flex;    justify-content: center;">Dang nhap</a>
    <a href="/time" style="    display: flex;    justify-content: center;">Xem gio</a>
    <a href="/tuDien" style="    display: flex;    justify-content: center;">Tu dien</a>
</div>
<form action="/discount" method="post" style="width: 300px;height: 300px;margin: auto; justify-content: center " >
    <table>
        <tr>
            <td>Description</td>
            <td><input type="text" placeholder="Mo ta san pham" name="description"></td>
        </tr>
        <tr>
            <td>Price</td>
            <td><input type="number" placeholder="Gia san pham" name="price"></td>
        </tr>
        <tr>
            <td>Discount</td>
            <td><input type="number" placeholder="Chiet Khau (don vi %)" name="discount"></td>
        </tr>
    </table>

    <button type="submit" >Tinh Toan</button>
</form>
</body>
</html>