<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mbtiForm.css">
    <script>
        function initializeMbti() {
            const mbtiDropdown = document.getElementById("mbtiSelect");
            const unknownBtn = document.getElementById("mbtiUnknown");
            const mbtiInput = document.getElementById("mbtiInput");
            
            // 서버에서 전달받은 기존 MBTI 데이터
            const existingMbti = "${user.mbti}";
            
            if (existingMbti && existingMbti.trim() !== "" && existingMbti !== "null") {
                // 기존 MBTI가 있으면 드롭다운에서 선택
                mbtiDropdown.value = existingMbti;
                mbtiInput.value = existingMbti;
                unknownBtn.classList.remove("selected");
            } else {
                // 기존 MBTI가 없거나 null이면 "몰라요" 선택
                mbtiDropdown.selectedIndex = 0; // "선택하기"로 초기화
                mbtiInput.value = "";
                unknownBtn.classList.add("selected");
            }
        }

		window.onload = function () {
	        const mbtiDropdown = document.getElementById("mbtiSelect");
	        const unknownBtn = document.getElementById("mbtiUnknown");

            // 기존 MBTI 데이터 초기화
            initializeMbti();

	        // 몰라요 버튼 클릭 시
	        unknownBtn.addEventListener("click", function () {
	            mbtiDropdown.selectedIndex = 0; // "선택하기"로 초기화
	            unknownBtn.classList.add("selected");
                document.getElementById("mbtiInput").value = "";
	        });

	        // 드롭다운에서 선택 시
	        mbtiDropdown.addEventListener("change", function () {
	            if (mbtiDropdown.value !== "") {
	                unknownBtn.classList.remove("selected");
                    document.getElementById("mbtiInput").value = this.value;
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
		<form action="${pageContext.request.contextPath}/mypage/updateMbti" method="post" class="form-layout">
		<div class="content">
		    <div class="title">MBTI를 알려주세요</div>
		    <div class="description">혹시 MBTI를 밝히기 싫거나 모르는 분들은 "몰라요"를 골라주세요</div>
			    <div class="mbti-select-wrapper">
			        <select class="mbti-dropdown" id="mbtiSelect">
			            <option value="" disabled selected>선택하기</option>
			            <option value="INTJ">INTJ</option>
			            <option value="INTP">INTP</option>
			            <option value="ENTJ">ENTJ</option>
			            <option value="ENTP">ENTP</option>
			            <option value="INFJ">INFJ</option>
			            <option value="INFP">INFP</option>
			            <option value="ENFJ">ENFJ</option>
			            <option value="ENFP">ENFP</option>
			            <option value="ISTJ">ISTJ</option>
			            <option value="ISFJ">ISFJ</option>
			            <option value="ESTJ">ESTJ</option>
			            <option value="ESFJ">ESFJ</option>
			            <option value="ISTP">ISTP</option>
			            <option value="ISFP">ISFP</option>
			            <option value="ESTP">ESTP</option>
			            <option value="ESFP">ESFP</option>
			        </select>
			        <input type="hidden" name="mbti" id="mbtiInput">
			        <div class="mbti-option" id="mbtiUnknown">몰라요</div>
			    </div>
			    </div>
			    <div class="footer">
			        <button type="submit" class="next-button">수정하기</button>
			    </div>
			</form>
	</div>
</body>
</html>