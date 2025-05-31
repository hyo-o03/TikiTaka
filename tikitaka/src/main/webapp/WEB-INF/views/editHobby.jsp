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
		
			<form action="${pageContext.request.contextPath}/user/updateHobby" method="post" id="hobbyForm">
			    <input type="hidden" name="hobby" id="hobbyInput">
			    <div class="interest-grid">
			        <div class="interest-item" data-value="산책">🌲 산책</div>
			        <div class="interest-item" data-value="헬스">💪 헬스</div>
			        <div class="interest-item" data-value="부동산">🏠 부동산</div>
			        <div class="interest-item" data-value="드라이브">🚗 드라이브</div>
			        <div class="interest-item" data-value="게임">🎮 게임</div>
			        <div class="interest-item" data-value="애니메이션">🎞️ 애니메이션</div>
			        <div class="interest-item" data-value="웹툰">💻 웹툰</div>
			        <div class="interest-item" data-value="드라마">📺 드라마</div>
			        <div class="interest-item" data-value="영화">🎬 영화</div>
			        <div class="interest-item" data-value="전시">🖼️ 전시</div>
			        <div class="interest-item" data-value="주식">📈 주식</div>
			        <div class="interest-item" data-value="클래식">🎼 클래식</div>
			        <div class="interest-item" data-value="뮤지컬·연극">🎭 뮤지컬·연극</div>
			        <div class="interest-item" data-value="만들기">🧵 만들기</div>
			        <div class="interest-item" data-value="맛집투어">🍜 맛집투어</div>
			        <div class="interest-item" data-value="여행">✈️ 여행</div>
			        <div class="interest-item" data-value="어학">🎣 어학</div>
			        <div class="interest-item" data-value="그림·글쓰기">✍️ 그림·글쓰기</div>
			        <div class="interest-item" data-value="독서">📚 독서</div>
			        <div class="interest-item" data-value="요리">🍳 요리</div>
			        <div class="interest-item" data-value="밴드">🎸 밴드</div>
			        <div class="interest-item" data-value="악기연주">🎻 악기연주</div>
			        <div class="interest-item" data-value="반려동물">🐶 반려동물</div>
			        <div class="interest-item" data-value="자연">🌳 자연</div>
			        <div class="interest-item" data-value="과학">🔬 과학</div>
			        <div class="interest-item" data-value="IT">💡 IT</div>
			        <div class="interest-item" data-value="우주">🪐 우주</div>
			        <div class="interest-item" data-value="다큐·교양">📜 다큐·교양</div>
			        <div class="interest-item" data-value="사진·영상촬영">📷 사진·영상촬영</div>
			    </div>
			    <div class="footer">
			        <button type="submit" class="next-button">수정하기</button>
			    </div>
			</form>
			<script>
				const hobbyInput = document.getElementById('hobbyInput');
				const items = document.querySelectorAll('.interest-item');

				items.forEach(function(item) {
				    item.addEventListener('click', function() {
				        if (item.classList.contains('selected')) {
				            // 이미 선택되어 있다면 해제
				            item.classList.remove('selected');
				        } else {
				            // 최대 5개까지 선택
				            const selectedCount = document.querySelectorAll('.interest-item.selected').length;
				            if (selectedCount >= 5) {
				                alert("최대 5개까지만 선택할 수 있습니다!");
				                return;
				            }
				            item.classList.add('selected');
				        }
				    });
				});

				document.getElementById('hobbyForm').addEventListener('submit', function(e) {
				    const selected = Array.from(document.querySelectorAll('.interest-item.selected')).map(item => item.getAttribute('data-value'));
				    if (selected.length === 0) {
				        alert('최소 1개의 관심사를 선택해주세요!');
				        e.preventDefault();
				        return;
				    }
				    hobbyInput.value = selected.join(',');
				});
			</script>
</body>
</html>