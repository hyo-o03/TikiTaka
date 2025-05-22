<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <title>설문-거주지
    </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/smokeForm.css">

    <meta charset="UTF-8">
</head>

<body>
    <div class="container">
        <div class="header">
	        <img src="${pageContext.request.contextPath}/images/leftBtn.png">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png">
        </div>
        <form action="${pageContext.request.contextPath}/user/religion" method="post" class="form-layout">
	        <div class="content">
	        	<div class="title">흡연을 하고 계시나요?</div>
	        	<div class="description">흡연여부는 상대와 만날때 정말 중요한 정보입니다!<br>본인의 흡연여부를 알려주세요</div>
	            <div class="option-box">
	                <label class="option">
	                  <span class="label-text">🚭비흡연자</span>
	                  <input type="radio" name="distance" value="near">
	                  <span class="circle"></span>
	                </label>
	              
	                <label class="option">
	                  <span class="label-text">🚬흡연자</span>
	                  <input type="radio" name="distance" value="far">
	                  <span class="circle"></span>
	                </label>
	              </div>
	        </div>
	        <div class="footer">
	            <button type="submit" class="next-button">다음단계</button>
	        </div>
		</form>
    </div>

</body>

</html>