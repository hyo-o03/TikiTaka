<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/alarm.css">
    <meta charset="UTF-8">
    <script>
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
	<div class="alarm-wrapper">
	    <div class="alarm-icon" onclick="toggleAlarmPopup()">🔔</div>
	
	    <!-- 알림 드롭다운 -->
	    <div id="alarmPopup" class="alarm-dropdown hidden">
	        <%-- 
	        <c:forEach var="msg" items="${alarms}">
	            <div class="alarm-item">
	                <span class="alarm-text">${msg}</span>
	                <button class="alarm-confirm">확인</button>
	            </div>
	        </c:forEach> 
	        --%>
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
</body>
</html>