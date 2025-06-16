<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/smokeForm.css">

    <meta charset="UTF-8">
    
    <script>
		function exit() {
		    if (confirm("수정을 취소하시겠습니까?")) {
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
        <form action="${pageContext.request.contextPath}/ideal/idealStyle" method="post" class="form-layout">
	        <div class="content">
	        	<div class="title">이상형의 흡연 여부를 알려주세요</div>
	        	<div class="description">흡연 여부는 연인을 만나는 데 있어 매우 중요합니다!<br>이상형이 흡연을 해도 괜찮은지 알려주세요!</div>
	            <div class="option-box">
	                <label class="option">
	                  <span class="label-text">🚭비흡연자</span>
	                  <input type="radio" name="smoke" value="비흡연">
	                  <span class="circle"></span>
	                </label>
	              
	                <label class="option">
	                  <span class="label-text">🚬흡연자</span>
	                  <input type="radio" name="smoke" value="흡연">
	                  <span class="circle"></span>
	                </label>
	                
	                <label class="option">
	                  <span class="label-text">🙅상관없어요</span>
	                  <input type="radio" name="smoke" value="흡연">
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