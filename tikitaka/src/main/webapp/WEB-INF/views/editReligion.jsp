<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/religionForm.css">
    <meta charset="UTF-8">
    
    <script>
	    window.onload = function () {
	        document.getElementById("religionForm").addEventListener("submit", function (e) {
	            const selected = document.querySelector('input[name="religion"]:checked');
	            if (!selected) {
	                alert("종교를 선택해주세요.");
	                e.preventDefault(); // 폼 제출 막기
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
		<form action="${pageContext.request.contextPath}/mypage/updateReligion" method="post" class="form-layout" id="religionForm">
		    <div class="content">
		        <div class="title">종교는 무엇인가요?</div>
		        <div class="description">상대와 만날 때 종교도 정말 중요해요<br>본인의 종교가 무엇인지 알려주세요</div>
		        <div class="option-box">
	                <label class="option">
	                  <span class="label-text">기독교</span>
	                  <input type="radio" name="religion" value="기독교" ${user.religion == '기독교' ? 'checked' : ''}>
	                  <span class="circle"></span>
	                </label>
	                <label class="option">
	                  <span class="label-text">천주교</span>
	                  <input type="radio" name="religion" value="천주교" ${user.religion == '천주교' ? 'checked' : ''}>
	                  <span class="circle"></span>
	                </label>
	                <label class="option">
	                    <span class="label-text">불교</span>
	                    <input type="radio" name="religion" value="불교" ${user.religion == '불교' ? 'checked' : ''}>
	                    <span class="circle"></span>
	                </label>
	                <label class="option">
	                    <span class="label-text">힌디</span>
	                    <input type="radio" name="religion" value="힌디" ${user.religion == '힌디' ? 'checked' : ''}>
	                    <span class="circle"></span>
	                </label>
	                <label class="option">
	                    <span class="label-text">무교</span>
	                    <input type="radio" name="religion" value="무교" ${user.religion == '무교' ? 'checked' : ''}>
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