<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <title>설문-종교
    </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/religionForm.css">

    <meta charset="UTF-8">
</head>

<body>
    <div class="container">
        <div class="header">
	        <img src="${pageContext.request.contextPath}/images/leftBtn.png">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png">
        </div>
		<form action="${pageContext.request.contextPath}/user/updateReligion" method="post" class="form-layout" id="religionForm">
		    <div class="content">
		        <div class="title">종교는 무엇인가요?</div>
		        <div class="description">상대와 만날 때 종교도 정말 중요해요<br>본인의 종교가 무엇인지 알려주세요</div>
		        <div class="option-box">
		            <label class="option">
		                <input type="radio" name="religion" value="기독교">
		                <span class="circle"></span>
		                <span class="label-text">기독교</span>
		            </label>
		            <label class="option">
		                <input type="radio" name="religion" value="천주교">
		                <span class="circle"></span>
		                <span class="label-text">천주교</span>
		            </label>
		            <label class="option">
		                <input type="radio" name="religion" value="불교">
		                <span class="circle"></span>
		                <span class="label-text">불교</span>
		            </label>
		            <label class="option">
		                <input type="radio" name="religion" value="힌디">
		                <span class="circle"></span>
		                <span class="label-text">힌디</span>
		            </label>
		            <label class="option">
		                <input type="radio" name="religion" value="무교">
		                <span class="circle"></span>
		                <span class="label-text">무교</span>
		            </label>
		        </div>
		    </div>
		    <div class="footer">
		        <button type="submit" class="next-button">수정하기</button>
		    </div>
		</form>
    </div>

</body>

</html>