

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
    <title>Học Sinh </title>

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
    <tr>
    <tr><th colspan="9">Danh sách Học Sinh</th></tr>
    <tr>
        <td colspan="2" style="text-align: left">
            <a href="/student?action=create">
            <button type="button" class="btn btn-primary">Create</button>
            </a>
        </td>
        <td colspan="7" style="text-align: right">
            <form action="/student?action=search" method="post">
                <input type="text" placeholder="nhập vào tên" name="key" required>
                <button type="submit" class="btn btn-info">Search</button>
            </form>
        </td>

    </tr>
        <th>MÃ SV</th>
        <th>Tên</th>
        <th>Ngày Sinh</th>
        <th>Địa chỉ</th>
        <th>Số Điện Thoại</th>
        <th>Email</th>
        <th>Mã Lớp</th>
        <th colspan="2">Hành động</th>
    </tr>
    <c:forEach var="hs" items="${hocSinhs}">
        <tr>
            <td>${hs.id}</td>
            <td>${hs.tenHS}</td>
            <td>${hs.ngaySinh}</td>
            <td>${hs.diaChi}</td>
            <td>${hs.sdt}</td>
            <td>${hs.email}</td>
            <td>${hs.malop}</td>
            <td><a href="/student?action=edit&id=${hs.id}"><button type="button" class="btn btn-warning">Edit</button>
            </a></td>
            <td><a  href="/student?action=delete&id=${hs.id}"  class="delete"  ><button type="button" class="btn btn-danger" >Delete</button>
            </a></td>
        </tr>
    </c:forEach>

</table>
</body>
<script>
    let deleteLinks = document.querySelectorAll('.delete');
    for (let i = 0; i < deleteLinks.length; i++) {
        deleteLinks[i].addEventListener('click', function(event) {
            event.preventDefault();
            let choice = confirm("Bạn chắc chắn xóa?");
            if (choice) {
                window.location.href = this.getAttribute('href');
            }
        });
    }
</script>
</html>

