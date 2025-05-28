<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/matchingCss.css">
    <title>Matching Result Page</title>
    <style>
	    .container {
		    background-image:
		            radial-gradient(circle 500px at top right, #FFDAED 0%, #FFDAED 30%, transparent 100%),
		            radial-gradient(circle 500px at bottom left, #D5DCED 0%, #D5DCED 30%, transparent 100%);
		    background-repeat: no-repeat;
		    background-size: 100% 100%;
		}
    </style>
</head>
<body>
    <div class="container" >
        <div class="header">
            <img src="${pageContext.request.contextPath}/images/leftBtn.png">
            <img src="${pageContext.request.contextPath}/images/escBtn.png">
        </div>
        <div class="content">
            <div class="title">소개팅으로 매칭할 상대를 선택해주세요</div>
            <div class="idealTypes">
                <c:forEach var="type" items="${matchingList}">
                    <div class="idealType" onclick="loadPopup('${type.address}', '${type.age}', '${type.introduce}' , '${type.facialType}')">
                        <div class="profileImg">
                            <img src="${type.facialType}" alt="profile image"> <!-- 예시: 이미지 -->
                        </div>
                        <div class="else">
                            <p>${type.address}  |  ${type.age}살</p> <!-- 예시: 이름 -->
                            <p>${type.introduce}</p>
                        </div>
                        <div class="rightBtn">
                            <img src="${pageContext.request.contextPath}/images/rightBtn.png">
                        </div>
                    </div>
                    <!-- 모달 영역 (처음엔 숨겨짐) -->
                    
                </c:forEach>
                
                <div id="popupModal" class="modal">
                        <div class="modal-content" id="popupContent">

                        </div>
                    </div>
            </div>
        </div>
    </div>
</body>
</html>

<script>
    function loadPopup(address, age, introduce) {
        fetch('${pageContext.request.contextPath}/match/idealTypeInfo?address=' + address + '&age=' + encodeURIComponent(age) + '&introduce='+ encodeURIComponent(introduce)) // Spring Controller에 매핑된 경로
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
