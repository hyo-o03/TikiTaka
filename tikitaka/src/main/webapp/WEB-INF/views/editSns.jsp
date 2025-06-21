<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/snsForm.css">
    <meta charset="UTF-8">
    <script>
        function initializeSnsData() {
            const kakaoInput = document.getElementById("kakaoIdInput");
            const extraInput = document.getElementById("extraSnsInput");
            const noSnsBtn = document.getElementById("noSnsBtn");
            
            // 서버에서 전달받은 기존 데이터
            const existingKakaoId = "${user.kakaoId}";
            const existingSnsId = "${user.snsId}";
            
            // 카카오 ID 설정
            if (existingKakaoId && existingKakaoId.trim() !== "" && existingKakaoId !== "null") {
                kakaoInput.value = existingKakaoId;
            }
            
            // SNS ID 설정
            if (existingSnsId && existingSnsId.trim() !== "" && existingSnsId !== "null") {
                extraInput.value = existingSnsId;
                extraInput.disabled = false;
                noSnsBtn.classList.remove("selected");
            } else {
                extraInput.value = "";
                extraInput.disabled = true;
                noSnsBtn.classList.add("selected");
            }
        }

		window.onload = function () {
	        const extraInput = document.getElementById("extraSnsInput");
	        const noSnsBtn = document.getElementById("noSnsBtn");

            // 기존 SNS 데이터 초기화
            initializeSnsData();

	        // 없어요 버튼 클릭 시
	        noSnsBtn.addEventListener("click", function (e) {
	        	e.preventDefault(); // form submit 막음
	        	
	        	if (extraInput.disabled) {
	                // 다시 입력 가능하게
	                extraInput.disabled = false;
	                extraInput.value = "";
	                extraInput.focus();
	                noSnsBtn.classList.remove("selected");
	            } else {
	                // 비활성화 및 초기화
	                extraInput.disabled = true;
	                extraInput.value = "";
	                noSnsBtn.classList.add("selected");
	            }
	        });

	        // 추가입력시
	        extraInput.addEventListener("click", function (e) {
	        	e.preventDefault(); // 브라우저 기본 동작 막기 (focus 안 됨 방지)
	        	if (extraInput.disabled) {
	                extraInput.disabled = false;
	                extraInput.focus();
	                noSnsBtn.classList.remove("selected");
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
		<form action="${pageContext.request.contextPath}/mypage/updateSns" method="post" class="form-layout" id="snsForm">
		    <div class="content">
		        <div class="title">공개할 sns를 알려주세요</div>
		        <div class="description">카카오톡 아이디는 매칭후 연락수단으로 필수 입력입니다.</div>
		        <div class="sns-section">
		            <label class="sns-label">필수공개</label>
		            <input type="text" class="sns-input" placeholder="카카오톡 아이디" name="kakaoId" id="kakaoIdInput" maxlength="20" required>
		          
		            <label class="sns-label">기타 sns</label>
		            <input type="text" class="sns-input" id="extraSnsInput" name="snsId" placeholder="공개할 sns 추가입력" maxlength="50">
		            <button type="button" class="sns-option" id="noSnsBtn">sns가 없어요</button>
		        </div>
		    </div>
		    <div class="footer">
		        <button type="submit" value="수정" class="next-button">수정하기</button>
		    </div>
		</form>
		<script>
		    const noSnsBtn = document.getElementById('noSnsBtn');
		    const extraInput = document.getElementById('extraSnsInput');
		    const snsForm = document.getElementById('snsForm');
		    const kakaoInput = document.getElementById('kakaoIdInput');

		    // 폼 제출 전 체크
		    snsForm.addEventListener('submit', function(e) {
		        // 카카오 아이디 미입력시 경고
		        if (!kakaoInput.value.trim()) {
		            alert('카카오톡 아이디는 필수입니다!');
		            kakaoInput.focus();
		            e.preventDefault();
		            return false;
		        }
		        // sns가 없어요가 선택된 경우, snsId 값이 비어있는지 확인
		        if (extraInput.disabled) {
		            extraInput.value = "";
		        }
		    });
	      
		</script>
	</div>
</body>
</html>