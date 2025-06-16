<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
    <meta charset="UTF-8">
    <script>
		function exit() {
		    if (confirm("가입을 취소하시겠습니까?")) {
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
	    <div class="center content">
	   	    <br>
		    <div class="text" style="padding-left: 15%;">전화번호와 이메일로 가입해서<br>새로운 인연을 만들어요!</div>
		    <br><br>
		    <form action="${pageContext.request.contextPath}/signup/terms" method="post">
			    <div class="input-wrapper">
				    <input type="text" class="text-input" name="registerPhone" placeholder="전화번호 혹은 이메일을 입력해주세요">
				</div>	
				<br>
				<div class="input-wrapper">
					<input type="text" class="text-input" name="registerEmail" placeholder="비밀번호를 입력해주세요">
			    </div>
			    <div class="footer">
			         <button type="submit" class="sibutton" name="registerPageButton">SignIn</button>
			    </div>
		    </form>
	    </div>
	</div>
</body>
</html>