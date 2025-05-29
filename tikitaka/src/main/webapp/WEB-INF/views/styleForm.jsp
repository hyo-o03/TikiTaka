<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>설문-스타일
    </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleForm.css">

    <meta charset="UTF-8">
    <script>
		function exit() {
		    if (confirm("설문 작성을 취소하시겠습니까?")) {
		        window.location.href = "${pageContext.request.contextPath}/signup/start";
		    }
		}
	</script>
</head>
<body>
<div class="container">
    <div class="header">
        <img src="${pageContext.request.contextPath}/images/leftBtn.png" onclick="history.back()">
        <img src="${pageContext.request.contextPath}/images/escBtn.png" onclick="exit()">
    </div>
   
	<form action="${pageContext.request.contextPath}/user/smoke" method="post" class="form-layout">
	    <div class="content">
			<div class="title">평소 사복 스타일이 궁금해요</div>
	        <div class="style-grid">
	            <button class="style-tag">캐주얼</button>
	            <button class="style-tag">모던</button>
	            <button class="style-tag">스트릿</button>
	            <button class="style-tag">페미닌</button>
	            <button class="style-tag">클래식</button>
	            <button class="style-tag">빈티지</button>
	          </div>
	    </div>
        <div class="footer">
            <button type="submit" class="next-button">다음단계</button>
        </div>
    </form>
</div>
<script>
    document.querySelectorAll('.style-tag').forEach(tag => {
      tag.addEventListener('click', () => {
        tag.classList.toggle('selected');
      });
    });
</script>
  
</body>
</html>