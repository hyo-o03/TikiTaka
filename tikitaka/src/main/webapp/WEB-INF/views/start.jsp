<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	<title>앱 시작</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/start.css">
	<meta charset="UTF-8">
</head>
<body>
	<div class="container">
		<div class="title">Tiki Taka</div>
		<div class="text">당신의 인연을 만들 수 있는<br>안전한 공간</div>
		<form action="${pageContext.request.contextPath}/signup/checkLogin" method="get">
			<div class="footer">
				<button type="submit" class="start-button">start</button>
			</div>
		</form>
	</div>
</body>
</html>