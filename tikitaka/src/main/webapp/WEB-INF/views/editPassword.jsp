<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>비밀번호 변경</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addressForm.css"> <%-- region-input 활용용 --%>
    <meta charset="UTF-8">
    <script>
	    function validatePassword(value) {
	        const trimmed = value.trim();
	
	        if (/\s/.test(trimmed)) {
	            alert("비밀번호에 공백을 포함할 수 없습니다.");
	            return false;
	        }
	        if (/[ㄱ-ㅎㅏ-ㅣ가-힣]/.test(trimmed)) {
	            alert("비밀번호에 한글을 포함할 수 없습니다.");
	            return false;
	        }
	
	        const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@!#$*&^%])[A-Za-z\d@!#$*&^%]{10,}$/;
	
	        if (!pwRegex.test(trimmed)) {
	            alert("비밀번호는 영문자, 숫자, 특수문자(@!#$*&^%)를 포함한 10자 이상이어야 합니다.");
	            return false;
	        }
	
	        return true;
	    }
	
	    window.onload = function () {
	        document.querySelector("form").addEventListener("submit", function (e) {
	            const newPw = document.getElementById("newPassword").value.trim();
	
	            if (newPw === "") {
	                alert("새 비밀번호를 입력해주세요.");
	                e.preventDefault();
	                return;
	            }
	
	            if (!validatePassword(newPw)) {
	                e.preventDefault();
	                return;
	            }
	        });
	    };
	    
	    function togglePasswordVisibility(inputId, iconElement) {
	        const input = document.getElementById(inputId);
	        const isPassword = input.type === "password";

	        input.type = isPassword ? "text" : "password";
	        iconElement.textContent = isPassword ? "🙈" : "👁️";
	    }
	</script>
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

			<div class="region-input" style="position: relative;">
			    <label for="currentPassword">현재 비밀번호</label>
			    <input type="password" id="currentPassword" name="currentPassword" required />
			    <span class="toggle-password" onclick="togglePasswordVisibility('currentPassword', this)">👁️</span>
			</div>
			
			<div class="region-input" style="position: relative;">
			    <label for="newPassword">새 비밀번호</label>
			    <input type="password" id="newPassword" name="newPassword" required />
			    <span class="toggle-password" onclick="togglePasswordVisibility('newPassword', this)">👁️</span>
			</div>
        </div>

        <div class="footer">
            <button type="submit" class="next-button">변경하기</button>
        </div>
    </form>
</div>
</body>
</html>