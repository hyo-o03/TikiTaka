<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/heightForm.css">

    <meta charset="UTF-8">
    <script>
		function exit() {
		    if (confirm("수정을 취소하시겠습니까?")) {
		        window.location.href = "${pageContext.request.contextPath}/mypage/mypage";
		    }
		}
		
		window.addEventListener("DOMContentLoaded", function () {
            const buttons = document.querySelectorAll('.height-tag');
            const hiddenInput = document.getElementById("selectedHeightType");

            buttons.forEach(button => {
                button.addEventListener("click", function (e) {
                    e.preventDefault(); // form submit 방지

                    // 기존 선택 해제
                    buttons.forEach(b => b.classList.remove("selected"));

                    // 새로 선택
                    this.classList.add("selected");

                    // 값 저장
                 // 값 저장: 키 값으로 매핑
                    const text = this.innerText.trim();
                    let height = 0.0;

                    if (text === "상관없음") {
                        height = 100;
                    } else if (text === "170 - 175") {
                        height = 170;
                    } else if (text === "175 - 180") {
                        height = 175;
                    } else if (text === "180 이상") {
                        height = 180;
                    }

                    hiddenInput.value = height;
                });
            });
        });
	</script>
</head>
<body>
<div class="container">
    <div class="header">
        <img src="${pageContext.request.contextPath}/images/leftBtn.png" onclick="history.back()">
        <img src="${pageContext.request.contextPath}/images/escBtn.png" onclick="exit()">
    </div>
   
	<form action="${pageContext.request.contextPath}/ideal/idealAddress" method="post" class="form-layout">
	    <div class="content">
			<div class="title">선호하는 이상형의 키를 골라주세요</div>
			
			<input id="selectedHeightType" name="height" type="hidden" value="${ideal.itHeight}"/>
				
	        <div class="heigth-grid">
	            <button class="height-tag ${ideal.itHeight == 100 ? 'selected' : ''}">상관없음</button>
	            <button class="height-tag ${ideal.itHeight == 170 ? 'selected' : ''}">170 - 175</button>
	            <button class="height-tag ${ideal.itHeight == 175 ? 'selected' : ''}">175 - 180</button>
	            <button class="height-tag ${ideal.itHeight == 180 ? 'selected' : ''}">180 이상</button>
	          </div>
	    </div>
        <div class="footer">
            <button type="submit" class="next-button">다음단계</button>
        </div>
    </form>
</div>
  
</body>
</html>