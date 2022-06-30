<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
  <style>
    body,form{
      text-align: center;
      width: 400px;
      height: auto;
      margin: auto;
    }
  </style>
</head>
<body >
<h2>Currency Converter</h2>
<form action="converter.jsp" method="post">
  <label>Rate: </label><br/>
  <input type="text" name="rate" placeholder="RATE" value="22000"/><br/>
  <label>USD: </label><br/>
  <input type="text" name="usd" placeholder="USD" value="0"/><br/>
  <input type = "submit" value = "Converter"/>
</form>
<h2>Vietnamese Dictionary</h2>
<form action="dictionary.jsp" method="post">
  <input type="text" name="search" placeholder="Enter your word: "/>
  <input type = "submit"  value = "Search"/>
</form>
<br>
<br>
<a href="customers.jsp"> Danh Sach Khach Hang</a>
</body>
</html>