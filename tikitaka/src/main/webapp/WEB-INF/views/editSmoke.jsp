<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/smokeForm.css">
    <meta charset="UTF-8">
    
    <script>
	    window.onload = function () {
	        document.querySelector("form").addEventListener("submit", function (e) {
	            const selected = document.querySelector('input[name="smoke"]:checked');
	            if (!selected) {
	                alert("흡연 여부를 선택해주세요.");
	                e.preventDefault(); // 제출 막기
	            }
	        });
	    };
	</script>
    
</head>

<body>
    <div class="container">
        <div class="header">
	        <div class="logo"><a href="${pageContext.request.contextPath}/user/home" class="homeBtn">Tiki-Taka</a></div>
	        <div class="icons">
	            <a href="${pageContext.request.contextPath}/user/myPage" class="mypageBtn">👤</a>
	            <jsp:include page="alarm.jsp" />
	        </div>
        </div>
        <form action="${pageContext.request.contextPath}/mypage/updateSmoke" method="post" class="form-layout">
	        <div class="content">
	        	<div class="title">흡연을 하고 계시나요?</div>
	        	<div class="description">흡연여부는 상대와 만날때 정말 중요한 정보입니다!<br>본인의 흡연여부를 알려주세요</div>
	            <div class="option-box">
	                <label class="option">
	                  <span class="label-text">🚭비흡연자</span>
	                  <input type="radio" name="smoke" value="비흡연" ${user.smoke == '비흡연' ? 'checked' : ''}>
	                  <span class="circle"></span>
	                </label>
	              
	                <label class="option">
	                  <span class="label-text">🚬흡연자</span>
	                  <input type="radio" name="smoke" value="흡연" ${user.smoke == '흡연' ? 'checked' : ''}>
	                  <span class="circle"></span>
	                </label>
	              </div>
	        </div>
	        <div class="footer">
	            <button type="submit" class="next-button">수정하기</button>
	        </div>
		</form>
    </div>

</body>

</html>