<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
    <meta charset="UTF-8">
    <script>
		function exit() {
		    if (confirm("가입을 취소하시겠습니까?")) {
		        window.location.href = "${pageContext.request.contextPath}/signup/start";
		    }
		}
		
		function validateEmailOrPhone(input) {
		    const value = input.trim();

		    const isEmail = value.includes('@') && value.includes('.');
		    const isPhone = /^010\d{8}$/.test(value);

		    if (isEmail) {
		        // 이메일 포맷 정교하게 검증 (예: name@domain.com)
		        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		        if (!emailRegex.test(value)) {
		            alert("올바른 이메일 형식이 아닙니다.");
		            return false;
		        }
		    } else if (isPhone) {
		        // 이미 정규식으로 충분히 체크됨
		    } else {
		        alert("유효하지 않은 이메일 또는 전화번호입니다.");
		        return false;
		    }

		    return true;
		}
		
		// 비밀번호 유효성 검사
	    function validatePassword(value) {
	        const trimmed = value.trim();
	        
	     	// 1. 공백 또는 한글 포함 여부 검사
	        if (/\s/.test(trimmed)) {
	            alert("비밀번호에 공백을 포함할 수 없습니다.");
	            return false;
	        }
	        if (/[ㄱ-ㅎㅏ-ㅣ가-힣]/.test(trimmed)) {
	            alert("비밀번호에 한글을 포함할 수 없습니다.");
	            return false;
	        }

	     	// 2. 영문자 + 숫자 + 허용 특수문자(@!#$*&^%) 포함, 길이 10자 이상
	        const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@!#$*&^%])[A-Za-z\d@!#$*&^%]{10,}$/;

	        if (!pwRegex.test(trimmed)) {
	            alert("비밀번호는 영문자, 숫자, 특수문자(@!#$*&^%)를 포함한 10자 이상이어야 합니다.");
	            return false;
	        }

	        return true;
	    }
		
	 	// 폼 유효성 검사 전체
	    window.onload = function () {
	        document.getElementById("registerForm").addEventListener("submit", function (e) {
	        	const emailOrPhone = document.getElementById("registeremailOrPhone").value.trim();
	            const password = document.getElementById("registerPassword").value.trim();

	            if (emailOrPhone.trim() === "") {
	                alert("이메일 또는 전화번호를 입력해주세요.");
	                e.preventDefault();
	                return;
	            }

	            if (!validateEmailOrPhone(emailOrPhone)) {
	                e.preventDefault();
	                return;
	            }

	            if (password.trim() === "") {
	                alert("비밀번호를 입력해주세요.");
	                e.preventDefault();
	                return;
	            }

	            if (!validatePassword(password)) {
	                e.preventDefault();
	                return;
	            }
	        });
	    };
	</script>
</head>
<body>
	<div class="container">
		<div class="header">
	        <img src="${pageContext.request.contextPath}/images/leftBtn.png" onclick="history.back()">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png" onclick="exit()">
	    </div>
	    <div class="title">Tiki Taka</div>
	    <div class="center content">
	   	    <br>
		    <div class="text" style="padding-left: 15%;">전화번호와 이메일로 가입해서<br>새로운 인연을 만들어요!</div>
		    <br><br>
		    <form id="registerForm" action="${pageContext.request.contextPath}/signup/terms" method="post">
			    <div class="input-wrapper">
				    <input type="text" class="text-input" name="registeremailOrPhone" id="registeremailOrPhone" placeholder="전화번호 혹은 이메일을 입력해주세요">
				</div>	
				<br>
				<div class="input-wrapper">
					<input type="text" class="text-input" name="registerPassword" id="registerPassword" placeholder="비밀번호를 입력해주세요">
			    </div>
			    <div class="footer">
			         <button type="submit" class="sibutton" name="registerPageButton">SignIn</button>
			    </div>
		    </form>
	    </div>
	</div>
	
	<c:if test="${noEmailOrPhone}">
    	<script>alert('이메일 또는 전화번호를 입력해주세요.');</script>
	</c:if>
	
	<c:if test="${duplicate}">
        <script>
            alert('이미 가입된 회원입니다.');
        </script>
    </c:if>

    <c:if test="${noPassword}">
        <script>
            alert('비밀번호를 입력해주세요.');
        </script>
    </c:if>
	
</body>
</html>