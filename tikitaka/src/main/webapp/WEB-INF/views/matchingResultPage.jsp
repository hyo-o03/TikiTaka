<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/matchBase.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/matchingResultPage.css">
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
    <div class="container" >
        <div class="header">
	        <img src="${pageContext.request.contextPath}/images/leftBtn.png" onclick="history.back()">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png" onclick="exit()">
        </div>
        <div class="content">
            <div class="title">소개팅으로 매칭할 상대를 선택해주세요</div>
            <div class="idealTypes">
                <c:forEach var="type" items="${idealTypes}">
                    <div class="idealType" onclick="loadPopup('${type.place}', '${type.age}', '${type.introduce}' , '${type.imageUrl}')">
                        <div class="profileImg">
                            <img src="${type.imageUrl}" alt="profile image"> <!-- 예시: 이미지 -->
                        </div>
                        <div class="else">
                            <p>${type.place}  |  ${type.age}살</p> <!-- 예시: 이름 -->
                            <p>${type.introduce}</p>
                        </div>
                        <div class="rightBtn">
                            <img src="${pageContext.request.contextPath}/images/rightBtn.png">
                        </div>
                    </div>
                    <!-- 모달 영역 (처음엔 숨겨짐) -->
                    <div id="popupModal" class="modal">
                        <div class="modal-content" id="popupContent">

                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>

<script>
    function loadPopup(place, age, imageUrl, introduce) {
        fetch('/idealTypeInfo?place=' + place + '&age=' + encodeURIComponent(age) + '&introduce='+ encodeURIComponent(introduce) + '&imageUrl=' + encodeURIComponent(imageUrl)) // Spring Controller에 매핑된 경로
            .then(response => response.text())
            .then(data => {
                document.getElementById('popupContent').innerHTML = data;
                document.getElementById('popupModal').style.display = 'block';
            });
    }

    function closePopup() {
        const popup = document.getElementById('choicePopup');
        popup.style.display = 'none';
    }
</script>
