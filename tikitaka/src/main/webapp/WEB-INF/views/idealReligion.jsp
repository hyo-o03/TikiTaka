<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/religionForm.css">

    <meta charset="UTF-8">
    <script>
		function exit() {
		    if (confirm("설문 작성을 취소하시겠습니까?")) {
		        window.location.href = "${pageContext.request.contextPath}/mypage/mypage";
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
		<form action="${pageContext.request.contextPath}/ideal/checkIdealForm" method="post" class="form-layout">
	        <div class="content">
	        	<div class="title">선호하는 이상형의 종교는 무엇인가요?</div>
	        	<div class="description">상대와 만날 때 종교도 정말 중요해요<br>본인의 종교가 무엇인지 알려주세요</div>
	            <div class="option-box">
	                <label class="option">
	                  <span class="label-text">기독교</span>
	                  <input ${ideal.itReligion == '"기독교"' ? 'checked' : ''} type="radio" name="religion" value="기독교">
	                  <span class="circle"></span>
	                </label>
	                <label class="option">
	                  <span class="label-text">천주교</span>
	                  <input ${ideal.itReligion == '천주교' ? 'checked' : ''} type="radio" name="religion" value="천주교">
	                  <span class="circle"></span>
	                </label>
	                <label class="option">
	                    <span class="label-text">불교</span>
	                    <input ${ideal.itReligion == '불교' ? 'checked' : ''} type="radio" name="religion" value="불교">
	                    <span class="circle"></span>
	                </label>
	                <label class="option">
	                    <span class="label-text">힌디</span>
	                    <input ${ideal.itReligion == '힌디' ? 'checked' : ''} type="radio" name="religion" value="힌디">
	                    <span class="circle"></span>
	                </label>
	                <label class="option">
	                    <span class="label-text">무교</span>
	                    <input ${ideal.itReligion == '무교' ? 'checked' : ''} type="radio" name="religion" value="무교">
	                    <span class="circle"></span>
	                </label>
	                <label class="option">
	                    <span class="label-text">상관없어요</span>
	                    <input ${ideal.itReligion == '상관없음' ? 'checked' : ''} type="radio" name="religion" value="상관없음">
	                    <span class="circle"></span>
	                </label>
	            </div>
	        </div>
	        <div class="footer">
	            <button type="submit" class="next-button">완료</button>
	        </div>
		</form>
    </div>

</body>

</html>