<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/matchBase.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/prioritySelect.css">
    <title>Tiki Taka</title>
    <script>
    
		function exit() {
		    if (confirm("시작 페이지로 돌아가시겠습니까?")) {
		        window.location.href = "${pageContext.request.contextPath}/signup/start";
		    }
		}
		let currentRank = 0;

		
		function selectItemFromPopup(value) {
            document.getElementById('choiceResult' + currentRank).innerText = value;
            document.getElementById('priority' + currentRank).value = value;
            closePopup();
        }
		
		function loadChoicePopup(rank) {
		    currentRank = rank;

		    fetch('${pageContext.request.contextPath}/ideal/idealTypeChoice')
		        .then(response => response.text())
		        .then(data => {
		            document.getElementById('choicePopupContent').innerHTML = data;
		            document.getElementById('choicePopup').style.display = 'block';

		            // 이벤트 바인딩은 fetch 이후에 반드시 수행
		            document.querySelectorAll('#choicePopupContent .idealTypeDetail').forEach(item => {
		                item.addEventListener('click', () => {
		                    const value = item.getAttribute('data-value');
		                    selectItemFromPopup(value);
		                });
		            });

		            
		        });
		}


		function closePopup() {
		    document.getElementById('choicePopup').style.display = 'none';
		}
		
		function validatePriorities() {
		    for (let i = 1; i <= 3; i++) {
		        const val = document.getElementById('priority' + i).value;
		        if (!val) {
		            alert(i + '순위를 선택해 주세요.');
		            return false; // 폼 제출 막음
		        }
		    }
		    return true; // 제출 허용
		}

		
	</script>
</head>
<body>
<div class="container">
    <div class="header">
        <img src="${pageContext.request.contextPath}/images/leftBtn.png" onclick="history.back()">
        <img src="${pageContext.request.contextPath}/images/escBtn.png" onclick="exit()">
    </div>
    <form action="${pageContext.request.contextPath}/match/matchRequestDone" method="post" class="form-layout" onsubmit="return validatePriorities()">
	    <div class="content">
	        <div class="title">이상형 조건 우선순위를 정해주세요</div>
	        <div class="description">매칭 받을 때 참고할 이상형 우선순위 3가지를 알려주세요</div>
	        <div class="choices">
	            <div class="choice" onclick="loadChoicePopup(1)">
	                <div class="lank">1순위</div>
	                <div class="choiceResult" id="choiceResult1">선택하러 가기</div>
	                <input type="hidden" name="priority1" id="priority1">
	                <div class="choiceBtn">
	                    <img src="${pageContext.request.contextPath}/images/rightBtn.png">
	                </div>
	            </div>
	            <div class="choice" onclick="loadChoicePopup(2)">
	                <div class="lank">2순위</div>
	                <div class="choiceResult" id="choiceResult2">선택하러 가기</div>
	                <input type="hidden" name="priority2" id="priority2">
	                <div class="choiceBtn">
	                    <img src="${pageContext.request.contextPath}/images/rightBtn.png">
	                </div>
	            </div>
	            <div class="choice" onclick="loadChoicePopup(3)">
	                <div class="lank">3순위</div>
	                <div class="choiceResult" id="choiceResult3">선택하러 가기</div>
	                <input type="hidden" name="priority3" id="priority3">
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
            <button type="submit" class="next-button">매칭하기</button>
        </div>
    </form>
</div>
</body>
</html>

