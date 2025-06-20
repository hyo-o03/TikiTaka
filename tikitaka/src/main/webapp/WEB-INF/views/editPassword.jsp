<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>비밀번호 변경</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addressForm.css"> <%-- region-input 활용용 --%>
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

    <form class="form-layout" method="post" action="/mypage/updatePassword">
        <div class="content">
            <div class="title">비밀번호 변경</div>
            <div class="description">안전한 비밀번호로 내 정보를 지켜보세요</div>
            
            <c:if test="${not empty errorMessage}">
                <div style="color: red; margin-bottom: 10px;">${errorMessage}</div>
            </c:if>

            <div class="region-input">
                <label for="currentPassword">현재 비밀번호</label>
                <input type="password" id="currentPassword" name="currentPassword" required />
            </div>

            <div class="region-input">
                <label for="newPassword">새 비밀번호</label>
                <input type="password" id="newPassword" name="newPassword" required />
            </div>
        </div>

        <div class="footer">
            <button type="submit" class="next-button">변경하기</button>
        </div>
    </form>
</div>
</body>
</html>