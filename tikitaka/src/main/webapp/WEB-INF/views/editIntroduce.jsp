<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <title>설문-자기소개
    </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/introduceForm.css">

    <meta charset="UTF-8">
</head>

<body>
    <div class="container">
        <div class="header">
	        <img src="${pageContext.request.contextPath}/images/leftBtn.png">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png">
        </div>
        <form action="${pageContext.request.contextPath}/user/updateIntroduce" method="post" class="form-layout">
	        <div class="content">
	        	<div class="title">간단한 한 줄 소개를 해주세요</div>
	        	<div class="description">매칭 시 상대에게 보여질 자기소개를 작성해주세요!</div>
				<div class="intro-box">
					<textarea id="introduce"name="introduce" class="intro-textarea" placeholder="자기소개를 입력해주세요 :)">${user.introduce}</textarea>
				</div>
	        </div>
	        <div class="footer">
				<button type="submit" value="수정" class="next-button">수정하기</button>
	        </div>
		</form>
    </div>

</body>

</html>