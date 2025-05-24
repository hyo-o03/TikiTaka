<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관심사</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/hobbyForm.css">
</head>
<body>
	<div class="container">
	    <div class="header">
	        <div class="logo">Tiki-Taka</div>
	        <div class="icons">
	            <span class="myPage">👤</span>
	            <span class="alarm">🔔</span>
	        </div>
	    </div>
		<div class="content">
		    <div class="title">관심사 정보 수정</div>
		
		    <div class="interest-grid">
		        <label class="interest-item">🌲 산책</label>
		        <label class="interest-item">💪 헬스</label>
		        <label class="interest-item">🏠 부동산</label>
		        <label class="interest-item">🚗 드라이브</label>
		        <label class="interest-item">🎮 게임</label>
		        <label class="interest-item">🎞️ 애니메이션</label>
		        <label class="interest-item">💻 웹툰</label>
		        <label class="interest-item">📺 드라마</label>
		        <label class="interest-item">🎬 영화</label>
		        <label class="interest-item">🖼️ 전시</label>
		        <label class="interest-item">📈 주식</label>
		        <label class="interest-item">🎼 클래식</label>
		        <label class="interest-item">🎭 뮤지컬·연극</label>
		        <label class="interest-item">🧵 만들기</label>
		        <label class="interest-item">🍜 맛집투어</label>
		        <label class="interest-item">✈️ 여행</label>
		        <label class="interest-item">🎣 어학</label>
		        <label class="interest-item">✍️ 그림·글쓰기</label>
		        <label class="interest-item">📚 독서</label>
		        <label class="interest-item">🍳 요리</label>
		        <label class="interest-item">🎸 밴드</label>
		        <label class="interest-item">🎻 악기연주</label>
		        <label class="interest-item">🐶 반려동물</label>
		        <label class="interest-item">🌳 자연</label>
		        <label class="interest-item">🔬 과학</label>
		        <label class="interest-item">💡 IT</label>
		        <label class="interest-item">🪐 우주</label>
		        <label class="interest-item">📜 다큐·교양</label>
		        <label class="interest-item">📷 사진·영상촬영</label>
		    </div>
		</div>
        <div class="footer">
            <button type="submit" class="next-button">수정하기</button>
        </div>
	</div>
</body>
</html>