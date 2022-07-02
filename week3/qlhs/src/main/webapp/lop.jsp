

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <title>Lớp </title>

  <style>
    tr,th,td,table{
      border: 1px solid black;
      border-collapse: collapse;
      text-align: center;
    }
    table{
      width: 1000px;
      margin: auto;

    }
    img{
      height: 160px;
      width: 160px;
    }
  </style>
</head>
<body>

    <table>
      <tr><th colspan="5">Danh sách lớp</th></tr>
      <tr><td colspan="5" style="text-align: left"><a href="/lop?action=create"><button type="button" class="btn btn-primary">Create</button>
      </a></td></tr>
      <tr>
        <th>MÃ Lớp</th>
        <th>Tên Lớp</th>
        <th>Số Học Sinh</th>
        <th colspan="2">Hành động</th>

      </tr>
      <c:forEach var="lop" items="${lops}">
        <tr>
          <td>${lop.maLop}</td>
          <td>${lop.tenLop}</td>
          <td>${lop.soLuong}</td>
          <td><a href="/lop?action=edit&id=${lop.maLop}"><button type="button" class="btn btn-warning">Edit</button>
          </a></td>
          <td><a href="/lop?action=delete&id=${lop.maLop}"><button type="button" class="btn btn-danger">Delete</button>
          </a></td>

        </tr>
      </c:forEach>

    </table>

</body>

</html>

