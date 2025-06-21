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
		function exit() {
		    if (confirm("수정을 취소하시겠습니까?")) {
		        window.location.href = "${pageContext.request.contextPath}/mypage/mypage";
		    }
		}
		
		window.onload = function () {
	        const mbtiDropdown = document.getElementById("mbtiSelect");
	        const unknownBtn = document.getElementById("unknownOption");
	        const hiddenInput = document.getElementById("mbtiHiddenInput");

	        // 몰라요 버튼 클릭 시
	        unknownBtn.addEventListener("click", function () {
	            mbtiDropdown.selectedIndex = 0; // "선택하기"로 초기화
	            unknownBtn.classList.add("selected");
	            hiddenInput.value = "상관없음";
	        });

	        // 드롭다운에서 선택 시
	        mbtiDropdown.addEventListener("change", function () {
	            if (mbtiDropdown.value !== "") {
	                unknownBtn.classList.remove("selected");
	                hiddenInput.value = mbtiDropdown.value;
	            }else {
	                hiddenInput.value = ""; // 드롭다운 초기화 시 명시적 처리
	            }
	        });
	    };
	</script>
</head>
<body>
	<div class="container">
	    <div class="header">
	        <img src="${pageContext.request.contextPath}/images/leftBtn.png" onclick="history.back()">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png" onclick="exit()">
	    </div>
	    <form action="${pageContext.request.contextPath}/ideal/idealSmoke" method="post" class="form-layout">
		<div class="content">
		    <div class="title">당신의 이상형의 MBTI는 무엇이었으면 좋겠나요?</div>
		    <div class="description">무엇이든 상관없다면 '상관없어요'를 눌러주세요</div>
		
		    <div class="mbti-select-wrapper">
		        <select class="mbti-dropdown" id="mbtiSelect">
		            <option value="" disabled selected>선택하기</option>
		            <option ${ideal.itMbti == 'INTJ' ? 'selected' : ''} value="INTJ">INTJ</option>
					<option ${ideal.itMbti == 'INTP' ? 'selected' : ''} value="INTP">INTP</option>
					<option ${ideal.itMbti == 'ENTJ' ? 'selected' : ''} value="ENTJ">ENTJ</option>
					<option ${ideal.itMbti == 'ENTP' ? 'selected' : ''} value="ENTP">ENTP</option>
					<option ${ideal.itMbti == 'INFJ' ? 'selected' : ''} value="INFJ">INFJ</option>
					<option ${ideal.itMbti == 'INFP' ? 'selected' : ''} value="INFP">INFP</option>
					<option ${ideal.itMbti == 'ENFJ' ? 'selected' : ''} value="ENFJ">ENFJ</option>
					<option ${ideal.itMbti == 'ENFP' ? 'selected' : ''} value="ENFP">ENFP</option>
					<option ${ideal.itMbti == 'ISTJ' ? 'selected' : ''} value="ISTJ">ISTJ</option>
					<option ${ideal.itMbti == 'ISFJ' ? 'selected' : ''} value="ISFJ">ISFJ</option>
					<option ${ideal.itMbti == 'ESTJ' ? 'selected' : ''} value="ESTJ">ESTJ</option>
					<option ${ideal.itMbti == 'ESFJ' ? 'selected' : ''} value="ESFJ">ESFJ</option>
					<option ${ideal.itMbti == 'ISTP' ? 'selected' : ''} value="ISTP">ISTP</option>
					<option ${ideal.itMbti == 'ISFP' ? 'selected' : ''} value="ISFP">ISFP</option>
					<option ${ideal.itMbti == 'ESTP' ? 'selected' : ''} value="ESTP">ESTP</option>
					<option ${ideal.itMbti == 'ESFP' ? 'selected' : ''} value="ESFP">ESFP</option>
		        </select>
		
		        <div class="mbti-option ${ideal.itMbti == '상관없음' ? 'selected' : ''}" id="unknownOption" >상관없어요</div>
		   		<input type="hidden" name="mbti" id="mbtiHiddenInput" />
		   		
		    </div>
		</div>
        <div class="footer">
            <button type="submit" class="next-button">다음단계</button>
        </div>

        </form>
	</div>
</body>
</html>