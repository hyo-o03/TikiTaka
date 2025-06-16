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
		    <form action="${pageContext.request.contextPath}/user/home" method="post">
			    <div class="input-wrapper">
				    <input type="text" class="text-input" name="emailOrPhone" placeholder="이메일 혹은 전화번호를 입력해주세요">
				</div>	
				<br>
				<div class="input-wrapper">
					<input type="text" class="text-input" name="password" placeholder="비밀번호를 입력해주세요">
			    </div>
			    <div class="footer">
			         <button type="submit" class="sibutton" name="registerPageButton">Login</button>
			    </div>
		    </form>
	    </div>
	</div>
</body>
</html>