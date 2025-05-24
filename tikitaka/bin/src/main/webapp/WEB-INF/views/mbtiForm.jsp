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
	        <img src="${pageContext.request.contextPath}/images/leftBtn.png">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png">
	    </div>
	    <form action="${pageContext.request.contextPath}/user/sns" method="post" class="form-layout">
		<div class="content">
		    <div class="title">MBTI를 알려주세요</div>
		    <div class="description">혹시 MBTI를 밝히기 싫거나 모르는 분들은 "몰라요"를 골라주세요</div>
		
		    <div class="mbti-select-wrapper">
		        <select class="mbti-dropdown" name="mbti">
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
		
		        <div class="mbti-option">몰라요</div>
		    </div>
		</div>
        <div class="footer">
            <button type="submit" class="next-button">다음단계</button>
        </div>
        </form>
	</div>
</body>
</html>