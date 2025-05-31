<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MBTI</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mbtiForm.css">
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
		    <div class="title">MBTI 정보 수정</div>
		
			<form action="${pageContext.request.contextPath}/user/updateMbti" method="post" id="mbtiForm">
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
			    <div class="footer">
			        <button type="submit" class="next-button">수정하기</button>
			    </div>
			</form>
			<script>
				document.getElementById('mbtiSelect').addEventListener('change', function() {
				    document.getElementById('mbtiInput').value = this.value;
				    document.getElementById('mbtiUnknown').classList.remove('selected');
				});

				document.getElementById('mbtiUnknown').addEventListener('click', function() {
				    document.getElementById('mbtiInput').value = '';
				    document.getElementById('mbtiSelect').selectedIndex = 0; // "선택하기"로 초기화
				    this.classList.add('selected');
				});
			</script>
	</div>
</body>
</html>