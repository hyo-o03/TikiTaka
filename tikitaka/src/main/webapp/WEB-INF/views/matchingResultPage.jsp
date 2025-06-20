<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/matchBase.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/matchingResultPage.css">
</head>
<body>
	<div class="container">
	    <div class="header">
	        <img src="${pageContext.request.contextPath}/images/leftBtn.png" onclick="history.back()">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png" onclick="exit()">
	    </div>
	
	    <c:choose>
	        <c:when test="${empty matchingList}">
	            <div class="no-matching-full">
	                <p class="no-matching-title">😢 오늘의 인연이 아직 없어요!</p>
	                <p class="no-matching-sub">
	                    지금 매칭을 신청하고<br>설렘 가득한 만남을 시작해보세요! 💘
	                </p>
	                <button class="no-matching-btn"
	                        onclick="location.href='${pageContext.request.contextPath}/user/home'">
	                    매칭 신청하러 가기
	                </button>
	            </div>
	        </c:when>
	        <c:otherwise>
	            <div class="content">
	                <div class="title">매칭할 상대를 선택해주세요</div>
	                <div class="idealTypes">
	                    <c:forEach var="type" items="${matchingList}">
	                        <div class="idealType"
	                             onclick="loadPopup('${type.address}', '${type.age}', '${type.introduce}' , '${type.userId}', '${type.facialType}')">
	                            <div class="profileImg">
									<c:choose>
									    <c:when test="${type.facialType eq '고양이'}"><p>🐱</p></c:when>
									    <c:when test="${type.facialType eq '강아지'}"><p>🐶</p></c:when>
									    <c:when test="${type.facialType eq '햄스터'}"><p>🐹</p></c:when>
									    <c:when test="${type.facialType eq '토끼'}"><p>🐰</p></c:when>
									    <c:when test="${type.facialType eq '곰'}"><p>🐻</p></c:when>
									    <c:when test="${type.facialType eq '늑대'}"><p>🐺</p></c:when>
									</c:choose>
								</div>
	                            <div class="else">
	                                <p>${type.address}</p>
	                                <p>${type.age}살</p>
	                            </div>
	                            <div class="rightBtn">
	                                <img src="${pageContext.request.contextPath}/images/rightBtn.png">
	                            </div>
	                        </div>
	                    </c:forEach>
	                </div>
	                <div id="popupModal" class="modal">
	                    <div class="modal-content" id="popupContent"></div>
	                </div>
	            </div>
	        </c:otherwise>
	    </c:choose>
	</div>
	
	<script>
	    function exit() {
	        if (confirm("시작 페이지로 돌아가시겠습니까?")) {
	            window.location.href = "${pageContext.request.contextPath}/signup/start";
	        }
	    }
	
	    function loadPopup(address, age, introduce, userId, facialType) {
	        fetch('${pageContext.request.contextPath}/match/idealTypeInfo?address=' + encodeURIComponent(address) +
	            '&age=' + encodeURIComponent(age) +
	            '&introduce=' + encodeURIComponent(introduce) +
	            '&userId=' + encodeURIComponent(userId) +
	            '&facialType=' + encodeURIComponent(facialType))
	            .then(response => response.text())
	            .then(data => {
	                document.getElementById('popupContent').innerHTML = data;
	                document.getElementById('popupModal').style.display = 'block';
	            });
	    }
	
	    function closePopup() {
	        document.getElementById('popupModal').style.display = 'none';
	    }
	</script>
</body>
</html>