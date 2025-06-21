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
		        window.location.href = "${pageContext.request.contextPath}/mypage/mypage";
		    }
		}
		
		function validateSmoke() {
            const radios = document.getElementsByName("smoke");
            let selected = false;

            for (let i = 0; i < radios.length; i++) {
                if (radios[i].checked) {
                    selected = true;
                    break;
                }
            }

            if (!selected) {
                alert("흡연 여부를 선택해주세요.");
                return false;
            }

            return true;
        }
	</script>
</head>

<body>
    <div class="container">
        <div class="header">
	        <img src="${pageContext.request.contextPath}/images/leftBtn.png" onclick="history.back()">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png" onclick="exit()">
        </div>
        <form action="${pageContext.request.contextPath}/friend/checkFriendForm" method="post" class="form-layout" onsubmit="return validateSmoke();">
	        <div class="content">
	        	<div class="title">친구의 흡연 여부를 알려주세요</div>
	        	<div class="description">친구가 흡연을 해도 괜찮은지 알려주세요!</div>
	            <div class="option-box">
	                <label class="option">
	                  <span class="label-text">🚭비흡연자</span>
	                  <input ${friend.ftSmoke == '비흡연' ? 'checked' : ''} name="smoke" type="radio" value="비흡연"/>
	                  <span class="circle"></span>
	                </label>
	              
	                <label class="option">
	                  <span class="label-text">🚬흡연자</span>
	                  <input ${friend.ftSmoke == '흡연' ? 'checked' : ''} name="smoke" type="radio" value="흡연"/>
	                  <span class="circle"></span>
	                </label>
	                
	                <label class="option">
	                  <span class="label-text">🙅상관없어요</span>
	                  <input ${friend.ftSmoke == '상관없음' ? 'checked' : ''} type="radio" name="smoke" value="상관없음">
	                  <span class="circle"></span>
	                </label>
	              </div>
	        </div>
	        <div class="footer">
	            <button type="submit" class="next-button">완료</button>
	        </div>
		</form>
    </div>

</body>

</html>