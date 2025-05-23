<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>거주지</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addressForm.css">
</head>
<body>
	<div class="container">
	    <div class="header">
	        <img src="${pageContext.request.contextPath}/images/leftBtn.png">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png">
	    </div>
	    <form action="${pageContext.request.contextPath}/user/hobby" method="post" class="form-layout">
			<div class="content" style="align-items: center;">
			    <div class="title">거주지 선호도를 골라주세요</div>
			    <div class="description">만나고 싶은 사람이 멀리 살고 있어도 괜찮나요?<br>매칭에 반영될 거주지 거리 선호도를 알려주세요</div>
			
			    <div class="region-input">
			        <label for="userRegion">내 거주 지역</label>
			        <input type="text" id="userRegion" name="userRegion" placeholder="예: 서울시 마포구">
			    </div>
			    
			    <div class="preference-options">
			        <label class="option">
			            <input type="radio" name="distancePreference" value="close">
			            가까웠으면 좋겠어요
			        </label>
			        <label class="option">
			            <input type="radio" name="distancePreference" value="far">
			            멀어도 괜찮아요
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