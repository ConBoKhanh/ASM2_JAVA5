<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>SD17313 - CRUD mau sac</title>
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

    <button>Thêm</button>
</sf:form>
</body>
</html>