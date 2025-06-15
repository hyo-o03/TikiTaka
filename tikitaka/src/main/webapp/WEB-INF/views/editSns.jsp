<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <title>설문-SNS
    </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/snsForm.css">

    <meta charset="UTF-8">
    <script>
		function exit() {
		    if (confirm("수정을 취소하시겠습니까?")) {
		        window.location.href = "${pageContext.request.contextPath}/signup/start";
		    }
		}
		
		window.onload = function () {
	        const snsInput = document.getElementById("snsId");
	        const unknownBtn = document.getElementById("noSnsBtn");

	        // 없어요 버튼 클릭 시
	        unknownBtn.addEventListener("click", function (e) {
	        	e.preventDefault(); // form submit 막음
	        	
	        	if (snsInput.disabled) {
	                // 다시 입력 가능하게
	                snsInput.disabled = false;
	                snsInput.value = "";
	                noSnsBtn.classList.remove("selected");
	            } else {
	                // 비활성화 및 초기화
	                snsInput.disabled = true;
	                snsInput.value = "";
	                noSnsBtn.classList.add("selected");
	            }
	        });

	        // 추가입력시
	        snsInput.addEventListener("input", function () {
	        	if (!snsInput.disabled && snsInput.value.trim() !== "") {
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
	            <a href="${pageContext.request.contextPath}/user/alarm" class="alarmBtn">🔔</a>
	        </div>
        </div>
		<form action="${pageContext.request.contextPath}/user/updateSns" method="post" class="form-layout" id="snsForm">
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

		    // "sns가 없어요" 버튼 클릭시 처리
		    noSnsBtn.addEventListener('click', (e) => {
		        e.preventDefault();
		        const isDisabled = extraInput.disabled;
		        if (isDisabled) {
		            extraInput.disabled = false;
		            extraInput.value = "";
		            noSnsBtn.classList.remove('selected');
		        } else {
		            extraInput.disabled = true;
		            extraInput.value = "";
		            noSnsBtn.classList.add('selected');
		        }
		    });

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