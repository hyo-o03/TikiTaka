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
		        window.location.href = "${pageContext.request.contextPath}/mypage/mypage";
		    }
		}
		
		function validateAddress() {
            const radios = document.getElementsByName("itDistancePref");
            let selected = false;

            for (let i = 0; i < radios.length; i++) {
                if (radios[i].checked) {
                    selected = true;
                    break;
                }
            }

            if (!selected) {
                alert("거주지 선호도를 선택해주세요.");
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
	    <form action="${pageContext.request.contextPath}/ideal/idealHobby" method="post" class="form-layout" onsubmit="return validateAddress();">
			<div class="content" style="align-items: center;">
			    <div class="title">거주지 선호도를 골라주세요</div>
			    <div class="description">연인이 멀리 살고 있어도 괜찮나요?<br>매칭에 반영될 거주지 거리 선호도를 알려주세요</div>
			    
			    <div class="preference-options">
			        <label class="option">
			            <input ${ideal.itDistancePref == 'close' ? 'checked' : ''} type="radio" name="itDistancePref" value="close">
			            가까웠으면 좋겠어요
			        </label>
			        <label class="option">
			            <input ${ideal.itDistancePref == 'far' ? 'checked' : ''} type="radio" name="itDistancePref" value="far">
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