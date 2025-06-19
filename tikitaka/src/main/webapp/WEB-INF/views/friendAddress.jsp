<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addressForm.css">
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
	    <form action="${pageContext.request.contextPath}/friend/friendHobby" method="post" class="form-layout">
			<div class="content" style="align-items: center;">
			    <div class="title">거주지 선호도를 골라주세요</div>
			    <div class="description">친구가 멀리 살고 있어도 괜찮나요?<br>매칭에 반영될 거주지 거리 선호도를 알려주세요</div>
			
			    <div class="region-input">
			        <label for="userRegion">내 거주 지역</label>
			        <input type="text" id="address" name="address" placeholder="예: 서울시 마포구">
			    </div>
			    
			    <div class="preference-options">
			        <label class="option">
			            <input type="radio" name="itAddressPref" value="close">
			            가까웠으면 좋겠어요
			        </label>
			        <label class="option">
			            <input type="radio" name="itAddressPref" value="far">
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