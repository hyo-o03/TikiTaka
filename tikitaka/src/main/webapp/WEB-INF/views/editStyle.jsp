<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleForm.css">
    <meta charset="UTF-8">
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
	<form action="${pageContext.request.contextPath}/mypage/updateStyle" method="post" id="styleForm">
	    <div class="content">
	        <div class="title">평소 사복 스타일이 궁금해요</div>
	        <input type="hidden" name="style" id="styleInput" value="${user.fashion}">
	        <div class="style-grid">
	            <button type="button" class="style-tag ${user.fashion == '캐주얼' ? 'selected' : ''}" data-value="캐주얼">캐주얼</button>
	            <button type="button" class="style-tag ${user.fashion == '모던' ? 'selected' : ''}" data-value="모던">모던</button>
	            <button type="button" class="style-tag ${user.fashion == '스트릿' ? 'selected' : ''}" data-value="스트릿">스트릿</button>
	            <button type="button" class="style-tag ${user.fashion == '페미닌' ? 'selected' : ''}" data-value="페미닌">페미닌</button>
	            <button type="button" class="style-tag ${user.fashion == '클래식' ? 'selected' : ''}" data-value="클래식">클래식</button>
	            <button type="button" class="style-tag ${user.fashion == '빈티지' ? 'selected' : ''}" data-value="빈티지">빈티지</button>
	        </div>
	    </div>
	    <div class="footer">
	        <button type="submit" value="수정" class="next-button">수정하기</button>
	    </div>
	</form>
	<script>
	    const tags = document.querySelectorAll('.style-tag');
	    const styleInput = document.getElementById('styleInput');
	    
	    tags.forEach(tag => {
	        tag.addEventListener('click', function(e) {
	            // 모든 태그의 선택 상태 해제
	            tags.forEach(t => t.classList.remove('selected'));
	            // 클릭된 태그 선택
	            tag.classList.add('selected');
	            // 숨겨진 input에 값 설정
	            styleInput.value = tag.getAttribute('data-value');
	        });
	    });
	    
	    // 폼 제출 시 검증
	    document.getElementById('styleForm').addEventListener('submit', function(e) {
	        if (!styleInput.value) {
	            alert('스타일을 하나 선택해주세요!');
	            e.preventDefault();
	        }
	    });
	</script>
  </div>
</body>
</html>