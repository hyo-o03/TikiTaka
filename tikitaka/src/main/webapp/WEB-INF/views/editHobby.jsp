<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/hobbyForm.css">
    <script>
		const maxSelection = 5;
		const minSelection = 2;
	    const selected = new Set();

	    function toggleHobby(label) {
	        const hobbyName = label.textContent.trim().replace(/^[^\s]+\s*/, ""); // 이모지 제거

	        if (label.classList.contains("selected")) {
	            label.classList.remove("selected");
	            selected.delete(hobbyName);
	        } else {
	            if (selected.size >= maxSelection) {
	                alert("최대 5개까지 선택할 수 있어요!");
	                return;
	            }
	            label.classList.add("selected");
	            selected.add(hobbyName);
	        }

	        // 선택한 취미들을 쉼표로 연결하여 hidden input에 저장
	        document.getElementById("selectedHobby").value = Array.from(selected).join(",");
	    }
	    
	    // 폼 제출 전 최소 선택 수 확인
	    window.onload = function () {
	        const form = document.querySelector("form");
	        form.addEventListener("submit", function (event) {
	            if (selected.size < minSelection) {
	                alert("관심사는 최소 2개 이상 선택해야 합니다!");
	                event.preventDefault(); // 제출 막기
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
	    <form action="${pageContext.request.contextPath}/user/updateHobby" method="post" class="form-layout">
		<div class="content">
		    <div class="title">관심사는 무엇인가요?</div>
		    <div class="description">당신의 관심사가 무엇인지 궁금해요! 2개 이상 필수로 골라주세요</div>
		
		    <!-- 취미 선택 값 담을 hidden input -->
			<input type="hidden" name="hobby" id="selectedHobby">	
					
		    <div class="interest-grid">
		        <label class="interest-item" onclick="toggleHobby(this)">🌲 산책</label>
		        <label class="interest-item" onclick="toggleHobby(this)">💪 헬스</label>
		        <label class="interest-item" onclick="toggleHobby(this)">🏠 부동산</label>
		        <label class="interest-item" onclick="toggleHobby(this)">🚗 드라이브</label>
		        <label class="interest-item" onclick="toggleHobby(this)">🎮 게임</label>
		        <label class="interest-item" onclick="toggleHobby(this)">🎞️ 애니메이션</label>
		        <label class="interest-item" onclick="toggleHobby(this)">💻 웹툰</label>
		        <label class="interest-item" onclick="toggleHobby(this)">📺 드라마</label>
		        <label class="interest-item" onclick="toggleHobby(this)">🎬 영화</label>
		        <label class="interest-item" onclick="toggleHobby(this)">🖼️ 전시</label>
		        <label class="interest-item" onclick="toggleHobby(this)">📈 주식</label>
		        <label class="interest-item" onclick="toggleHobby(this)">🎼 클래식</label>
		        <label class="interest-item" onclick="toggleHobby(this)">🎭 뮤지컬·연극</label>
		        <label class="interest-item" onclick="toggleHobby(this)">🧵 만들기</label>
		        <label class="interest-item" onclick="toggleHobby(this)">🍜 맛집투어</label>
		        <label class="interest-item" onclick="toggleHobby(this)">✈️ 여행</label>
		        <label class="interest-item" onclick="toggleHobby(this)">🎣 어학</label>
		        <label class="interest-item" onclick="toggleHobby(this)">✍️ 그림·글쓰기</label>
		        <label class="interest-item" onclick="toggleHobby(this)">📚 독서</label>
		        <label class="interest-item" onclick="toggleHobby(this)">🍳 요리</label>
		        <label class="interest-item" onclick="toggleHobby(this)">🎸 밴드</label>
		        <label class="interest-item" onclick="toggleHobby(this)">🎻 악기연주</label>
		        <label class="interest-item" onclick="toggleHobby(this)">🐶 반려동물</label>
		        <label class="interest-item" onclick="toggleHobby(this)">🌳 자연</label>
		        <label class="interest-item" onclick="toggleHobby(this)">🔬 과학</label>
		        <label class="interest-item" onclick="toggleHobby(this)">💡 IT</label>
		        <label class="interest-item" onclick="toggleHobby(this)">🪐 우주</label>
		        <label class="interest-item" onclick="toggleHobby(this)">📜 다큐·교양</label>
		        <label class="interest-item" onclick="toggleHobby(this)">📷 사진·영상촬영</label>
		    </div>
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
	</div>
</body>
</html>