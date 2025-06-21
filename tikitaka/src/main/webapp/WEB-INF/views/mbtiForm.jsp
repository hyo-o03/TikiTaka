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
		    if (confirm("설문 작성을 취소하시겠습니까?")) {
		        window.location.href = "${pageContext.request.contextPath}/signup/start";
		    }
		}
		
		window.onload = function () {
	        const mbtiDropdown = document.getElementById("mbtiSelect");
	        const unknownBtn = document.getElementById("unknownOption");

	        // 몰라요 버튼 클릭 시
	        unknownBtn.addEventListener("click", function () {
	            mbtiDropdown.selectedIndex = 0; // "선택하기"로 초기화
	            unknownBtn.classList.add("selected");
	        });

	        // 드롭다운에서 선택 시
	        mbtiDropdown.addEventListener("change", function () {
	            if (mbtiDropdown.value !== "") {
	                unknownBtn.classList.remove("selected");
	            }
	        });
	    };
	    
	    function validateMbti() {
	        const mbtiValue = document.getElementById("mbtiSelect").value;
	        const unknownSelected = document.getElementById("unknownOption").classList.contains("selected");

	        if (mbtiValue === "" && !unknownSelected) {
	            alert("MBTI를 선택하거나 '몰라요'를 눌러주세요.");
	            return false;
	        }

	        return true;
	    }
	</script>
</head>
<body>
	<div class="container">
	    <div class="header">
	        <img src="${pageContext.request.contextPath}/images/leftBtn.png" onclick="history.back()">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png" onclick="exit()">
	    </div>
	    <form action="${pageContext.request.contextPath}/user/sns" method="post" class="form-layout" onsubmit="return validateMbti();">
		<div class="content">
		    <div class="title">MBTI를 알려주세요</div>
		    <div class="description">혹시 MBTI를 밝히기 싫거나 모르는 분들은 "몰라요"를 골라주세요</div>
		
		    <div class="mbti-select-wrapper">
		        <select class="mbti-dropdown" name="mbti" id="mbtiSelect">
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
		
		        <div class="mbti-option" id="unknownOption">몰라요</div>
		    </div>
		</div>
        <div class="footer">
            <button type="submit" class="next-button">다음단계</button>
        </div>
        </form>
	</div>
</body>
</html>