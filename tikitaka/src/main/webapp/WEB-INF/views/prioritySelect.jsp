<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/matchBase.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/prioritySelect.css">
    <title>Matching Result Page</title>
    <script>
		function exit() {
		    if (confirm("시작 페이지로 돌아가시겠습니까?")) {
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
    <form action="${pageContext.request.contextPath}/match/matchRequestDone``1" method="post" class="form-layout">
	    <div class="content">
	        <div class="title">이상형 조건 우선순위를 정해주세요</div>
	        <div class="description">매칭 받을 때 참고할 이상형 우선순위 3가지를 알려주세요</div>
	        <div class="choices">
	            <div class="choice" onclick="loadChoicePopup()">
	                <div class="lank">1순위</div>
	                <div class="choiceResult">선택하러 가기</div>
	                <div class="choiceBtn">
	                    <img src="${pageContext.request.contextPath}/images/rightBtn.png">
	                </div>
	            </div>
	            <div class="choice">
	                <div class="lank">2순위</div>
	                <div class="choiceResult">선택하러 가기</div>
	                <div class="choiceBtn">
	                    <img src="${pageContext.request.contextPath}/images/rightBtn.png">
	                </div>
	            </div>
	            <div class="choice">
	                <div class="lank">3순위</div>
	                <div class="choiceResult">선택하러 가기</div>
	                <div class="choiceBtn">
	                    <img src="${pageContext.request.contextPath}/images/rightBtn.png">
	                </div>
	            </div>
	        </div>
	        
	        <!-- 모달 영역 (처음엔 숨겨짐) -->
	        <div id="choicePopup" class="modal-lanking">
	            <div class="modal-content" id="choicePopupContent">
	
	            </div>
	        </div>
	    </div>
    	<div class="footer">
            <button type="submit" class="next-button">다음단계</button>
        </div>
    </form>
</div>
</body>
</html>

<script>
    function loadChoicePopup() {
        fetch('/idealTypeChoice') // Spring Controller에 매핑된 경로
            .then(response => response.text())
            .then(data => {
                document.getElementById('choicePopupContent').innerHTML = data;
                document.getElementById('choicePopup').style.display = 'block';
            });
    }

    function closePopup() {
        const popup = document.getElementById('choicePopup');
        popup.style.display = 'none';
    }
</script>
