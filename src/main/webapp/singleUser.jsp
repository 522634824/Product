<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<title>Insert title here</title>
</head>
<body>
<form action="updateUser.action" method="post">
<table>

<tr>
<td>userid:<input type="text" name="userid" value="${user.userid}"></td>
<td>username:<input type="text" name="username" value="${user.username}"></td>
<td>password:<input type="text" name="password" value="${user.password}"></td>
<td>name:<input type="text" name="name" value="${user.name}"></td>
<td>sex:<input type="text" name="sex" value="${user.sex}"></td>
<td>age:<input type="text" name="age" value="${user.age}"></td>
<td>tel:<input type="text" name="tel" value="${user.tel}"></td>
<td>power:<input type="text" name="power" value="${user.power}"></td>
<td><input type="submit" value="修改"> </td>
</tr>

</table>
</form>




</body>
</html>