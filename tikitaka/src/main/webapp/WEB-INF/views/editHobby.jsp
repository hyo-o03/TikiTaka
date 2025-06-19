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
	    
	    // 페이지 로드 시 기존 취미 데이터 초기화
	    function initializeSelectedHobbies() {
	        // 서버에서 전달받은 기존 취미 데이터
	        const existingHobbies = "${user.hobby}"; // 또는 적절한 속성명 사용
	        
	        if (existingHobbies && existingHobbies.trim() !== "") {
	            const hobbyArray = existingHobbies.split(",");
	            
	            // 모든 취미 라벨을 순회하면서 기존 취미와 매칭되는 것들을 선택 처리
	            const labels = document.querySelectorAll('.interest-item');
	            labels.forEach(label => {
	                const hobbyName = label.textContent.trim().replace(/^[^\s]+\s*/, ""); // 이모지 제거
	                
	                if (hobbyArray.includes(hobbyName)) {
	                    label.classList.add("selected");
	                    selected.add(hobbyName);
	                }
	            });
	            
	            // hidden input에 초기값 설정
	            document.getElementById("selectedHobby").value = Array.from(selected).join(",");
	        }
	    }
	    
	    // 폼 제출 전 최소 선택 수 확인
	    window.onload = function () {
	        // 기존 취미 데이터 초기화
	        initializeSelectedHobbies();
	        
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
	</div>
</body>
</html>