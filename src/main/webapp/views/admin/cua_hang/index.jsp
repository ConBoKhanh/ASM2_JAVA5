<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>SD17313 - CRUD Cua Hang</title>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <%@ taglib prefix="f" uri="jakarta.tags.functions" %>
</head>
<body>
    <a href="/cua-hang/createch">Thêm mới</a>
    <table>
        <thead>
            <th>STT</th>
            <th>Mã</th>
            <th>Tên</th>
            <th>Địa Chỉ</th>
            <th>Thành Phố</th>
            <th>Quốc gia</th>
            <th colspan="2">Thao tác</th>
        </thead>
        <tbody>
        <c:forEach items="${ data }" var="ch">
            <tr>
                <td>${ ch.id }</td>
                <td>${ ch.ma }</td>
                <td>${ ch.ten }</td>
                <td>${ ch.diaChi }</td>
                <td>${ ch.thanhPho }</td>
                <td>${ ch.quocGia }</td>
                <td>
                    <a href="/cua-hang/edit/${ch.id}">Cập nhật</a>
                </td>
                <td>
                    <a href="/cua-hang/delete/${ch.id}">Xóa</a>
                </td>
            </tr>
        </c:forEach>

            </ul>
        </nav>
        </tbody>
    </table>
</body>
</html>