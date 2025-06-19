<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addressForm.css">
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
	    <form id="addressForm" action="${pageContext.request.contextPath}/mypage/updateAddress" method="post" class="form-layout">
			<div class="content" style="align-items: center;">
			    <div class="title">거주지 선호도를 골라주세요</div>
			    <div class="description">만나고 싶은 사람이 멀리 살고 있어도 괜찮나요?<br>매칭에 반영될 거주지 거리 선호도를 알려주세요</div>
			
			    <div class="region-input">
			        <label for="userRegion">내 거주 지역</label>
			        <input type="text" id="address" name="address" placeholder="예: 서울시 마포구" value="${user.address}">
			    </div>
			    
			    <div class="preference-options">
			        <label class="option">
			            <input type="radio" name="itAddressPref" value="close">
			            가까웠으면 좋겠어요
			        </label>
			        <label class="option">
			            <input type="radio" name="itAddressPref" value="far">
			            멀어도 괜찮아요
			        </label>
			    </div>
			</div>
	        <div class="footer">
	            <button type="submit" class="next-button">수정하기</button>
	        </div>
        </form>
     </div>
     <script>
         window.addEventListener('DOMContentLoaded', function() {
             const form = document.getElementById('addressForm');
             const addressInput = document.getElementById('address');
             
             // 폼 제출 전 주소 입력 검증
             form.addEventListener('submit', function(e) {
                 if (!addressInput.value.trim()) {
                     alert('거주 지역을 입력해주세요!');
                     e.preventDefault();
                 }
             });
         });
     </script>
</body>
</html>