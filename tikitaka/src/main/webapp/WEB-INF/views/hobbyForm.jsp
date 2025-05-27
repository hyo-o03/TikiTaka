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
    <script>
		function exit() {
		    if (confirm("설문 작성을 취소하시겠습니까?")) {
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
	    <form action="${pageContext.request.contextPath}/user/mbti" method="post" class="form-layout">
		<div class="content">
		    <div class="title">관심사는 무엇인가요?</div>
		    <div class="description">당신의 관심사가 무엇인지 궁금해요! 2개 이상 필수로 골라주세요</div>
		
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
            <button type="submit" class="next-button">다음단계</button>
        </div>
        </form>
	</div>
</body>
</html>