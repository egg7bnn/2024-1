<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP addcookie.jsp</title>
</head>
<body>
<h1>쿠키만들기 예제</h1>
<hr>

<% 
    Cookie cookie = new Cookie("user", "kang"); 
    cookie.setMaxAge(2 * 60); 
    response.addCookie(cookie); 
%>

<hr>
<a href="7-2 addtimecookie.jsp">현재접속시간을쿠키로추가</a>
</body>
</html>
