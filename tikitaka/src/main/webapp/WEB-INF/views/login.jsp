<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <meta charset="UTF-8">
    <script>
		function exit() {
		    if (confirm("처음으로 돌아가시겠습니까?")) {
		        window.location.href = "${pageContext.request.contextPath}/signup/start";
		    }
		}
		
	    function togglePasswordVisibility(inputId, iconElement) {
	        const input = document.getElementById(inputId);
	        const isPassword = input.type === "password";

	        input.type = isPassword ? "text" : "password";
	        iconElement.textContent = isPassword ? "🙈" : "👁️";
	    }
		
		<c:if test="${notFound}">
        alert('이메일/전화번호 또는 비밀번호가 올바르지 않습니다.');
    </c:if>
	</script>
</head>
<body>
	<div class="container">
		<div class="header">
	        <img src="${pageContext.request.contextPath}/images/leftBtn.png" onclick="history.back()">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png" onclick="exit()">
	    </div>
	    <div class="title">Tiki Taka</div>
	    <div class="content">
	   	    <br>
		    <div class="text" style="padding-left: 15%;">어서오세요!<br>오늘도 같이 좋은 인연을 찾아봐요 🤩</div>
		    <br><br>
		    <form action="${pageContext.request.contextPath}/signup/loginCheck" method="post">
			    <div class="input-wrapper">
				    <input type="text" class="text-input" name="emailOrPhone" placeholder="이메일 혹은 전화번호를 입력해주세요">
				</div>	
				<br>
				<div class="input-wrapper" style="position: relative;">
					<input type="password" class="text-input" name="password" id="password" placeholder="비밀번호를 입력해주세요">
			    	<span class="toggle-password" onclick="togglePasswordVisibility('password', this)">👁️</span>  	
			    </div>
			    <div class="footer">
			         <button type="submit" class="sibutton" name="loginPageButton">Login</button>
			    </div>
		    </form>
	    </div>
	</div>
	
</body>
</html>