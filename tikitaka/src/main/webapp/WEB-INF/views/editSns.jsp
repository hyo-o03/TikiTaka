<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <title>설문-SNS
    </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/snsForm.css">

    <meta charset="UTF-8">
</head>

<body>
    <div class="container">
        <div class="header">
	        <img src="${pageContext.request.contextPath}/images/leftBtn.png">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png">
        </div>
        <form action="${pageContext.request.contextPath}/user/style" method="post" class="form-layout">
	        <div class="content">
	        	<div class="title">공개할 sns를 알려주세요</div>
	        	<div class="description">카카오톡 아이디는 매칭후 연락수단으로 필수 입력입니다.</div>
	            <div class="sns-section">
	                <label class="sns-label">필수공개</label>
	                <input type="text" class="sns-input" placeholder="카카오톡 아이디">
	              
	                <label class="sns-label">기타 sns</label>
	                <input type="text" class="sns-input" id="extraSnsInput" placeholder="공개할 sns 추가입력">
					<button class="sns-option" id="noSnsBtn">sns가 없어요</button>
	
	              </div>
	        </div>
	        <div class="footer">
	            <button type="submit" class="next-button">다음단계</button>
	        </div>
		</form>
    </div>
    <script>
        const noSnsBtn = document.getElementById('noSnsBtn');
        const extraInput = document.getElementById('extraSnsInput');
      
        noSnsBtn.addEventListener('click', () => {
          const isDisabled = extraInput.disabled;
      
          if (isDisabled) {
            extraInput.disabled = false;
            noSnsBtn.classList.remove('selected');
          } else {
            extraInput.disabled = true;
            noSnsBtn.classList.add('selected');
          }
        });
        
      </script>
</body>
</html>