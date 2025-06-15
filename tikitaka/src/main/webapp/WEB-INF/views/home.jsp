<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Matching Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <meta charset="UTF-8">
    <script>
		function exit() {
		    if (confirm("설문 작성을 취소하시겠습니까?")) {
		        window.location.href = "${pageContext.request.contextPath}/signup/start";
		    }
		}
		
        function toggleAlarmPopup() {
            const popup = document.getElementById("alarmPopup");
            popup.classList.toggle("hidden");
        }

        // 외부 클릭 시 알림창 닫기
        document.addEventListener('click', function (e) {
            const icon = document.querySelector('.alarm-icon');
            const popup = document.getElementById('alarmPopup');

            if (!icon.contains(e.target) && !popup.contains(e.target)) {
                popup.classList.add('hidden');
            }
        });
	</script>
</head>
<body>
<div class="container">
    <div class="header">
        <div class="logo"><a href="${pageContext.request.contextPath}/user/home" class="homeBtn">Tiki-Taka</a></div>
        <div class="icons">
            <a href="${pageContext.request.contextPath}/user/myPage" class="mypageBtn">👤</a>
            <div class="alarm-wrapper">
                <div class="alarm-icon" onclick="toggleAlarmPopup()">🔔</div>

                <!-- 알림 드롭다운 -->
                <div id="alarmPopup" class="alarm-dropdown hidden">
<%--                     <c:forEach var="msg" items="${alarms}">
                        <div class="alarm-item">
                            <span class="alarm-text">${msg}</span>
                            <button class="alarm-confirm">확인</button>
                        </div>
                    </c:forEach> --%>
                    <div class="alarm-item">
				        <span class="alarm-text">오늘의 이상형 추천이 도착했습니다!</span>
				        <button class="alarm-confirm">확인</button>
				    </div>
				    <div class="alarm-item">
				        <span class="alarm-text">새로운 매칭 상대가 있어요!</span>
				        <button class="alarm-confirm">확인</button>
				    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main">
        <p class="todayMatching">오늘의 매칭</p>
        <div class="matchings">
            <div class="friendMatching">
                <a href="${pageContext.request.contextPath}/match/prioritySelect" style="text-decoration: none; color: inherit;">
                    <p class="matchingMent">오늘의 친구를<br>만나러 가요</p>
                    <img src="${pageContext.request.contextPath}/images/friendHeart.png">
                </a>
            </div>
            <div class="loverMatching">
                <a href="${pageContext.request.contextPath}/match/prioritySelect" style="text-decoration: none; color: inherit;">
                    <p class="matchingMent">오늘의 인연을<br>만나러 가요</p>
                    <img src="${pageContext.request.contextPath}/images/loverHeart.png">
                </a>
            </div>
        </div>
        <div class="matchingResult">
            <div class="mREmoji">🥰</div>
            <div class="mRText">
                <p class="mRSubText">오늘의 매칭 알림</p>
                <p class="mRText">오늘 매칭된 상대 확인하기</p>
            </div>
            <a href="${pageContext.request.contextPath}/match/matchingResultPage" style="text-decoration: none;"><img class="mRBtn" src="${pageContext.request.contextPath}/images/mRBtn.png"></a>
        </div>
    </div>
</div>
</body>
</html>
