<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>SD17313 - CRUD Cua Hang</title>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
</head>
<body>
<sf:form action="${action}" method="post"
     modelAttribute="ms">
    <div>
        <label>Mã</label>
        <sf:input path="ma" />
        <sf:errors path="ma" />
    </div>
    <div>
        <label>Tên</label>
        <sf:input path="ten" />
    </div>
    <div>
        <label>Địa chỉ</label>
        <sf:input path="diaChi" />
    </div>
    <div>
        <label>Thành Phố</label>
        <sf:input path="thanhPho" />
    </div>

    <div>
        <label>Quốc Gia</label>
        <sf:input path="quocGia" />
    </div>
    <button>Thêm</button>
</sf:form>
</body>
</html>