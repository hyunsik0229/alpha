<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>spring security 적용</h1>
<hr>
<sec:authorize access="isAnonymous()">
로그인 하지 않았습니다
</sec:authorize>
<sec:authorize access="isAuthenticated()">
로그인 함. 사용자는 <sec:authentication property="name"/>
</sec:authorize>

</body>
</html>