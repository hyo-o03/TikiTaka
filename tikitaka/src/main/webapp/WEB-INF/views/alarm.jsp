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
        
        function openProfilePopup(address, age, hobby, religion, smoke, introduce, userId, facialType, kakaoId, matchId, status, alarmId, element) {
            // 알람 isChecked 업데이트
			fetch('/alarm/markAsRead?alarmId=' + alarmId)
			    .then(() => {
			        const alarmBox = element?.closest('.alarm-box');
			        if (alarmBox && !alarmBox.querySelector('.read-label')) {
			            const readMark = document.createElement('span');
			            readMark.className = 'read-label';
			            readMark.textContent = '읽음';
			            readMark.style.fontSize = '12px';
			            readMark.style.color = '#999';
			            readMark.style.marginLeft = '8px';
			            alarmBox.appendChild(readMark);
			        }
			    });

            const url = '/match/idealTypeInfoInAlarm?' +
                'address=' + encodeURIComponent(address) +
                '&age=' + encodeURIComponent(age) +
                '&hobby=' + encodeURIComponent(hobby) +
                '&religion=' + encodeURIComponent(religion) +
                '&smoke=' + encodeURIComponent(smoke) +
                '&introduce=' + encodeURIComponent(introduce) +
                '&userId=' + encodeURIComponent(userId) +
                '&facialType=' + encodeURIComponent(facialType) +
                '&kakaoId=' + encodeURIComponent(kakaoId) +
                '&matchId=' + encodeURIComponent(matchId) +
                '&status=' + encodeURIComponent(status);

            fetch(url)
                .then(response => response.text())
                .then(html => {
                    const modal = document.createElement('div');
                    modal.classList.add('modal-overlay');
                    modal.innerHTML = html;
                    document.body.appendChild(modal);
                });
        }

        function closePopup() {
            const modal = document.querySelector('.modal-overlay');
            if (modal) modal.remove();
        }
	</script>
</head>
<body>
	<div class="alarm-wrapper">
	    <div class="alarm-icon" onclick="toggleAlarmPopup()">🔔</div>
	
	    <!-- 알림 드롭다운 -->
		<div id="alarmPopup" class="alarm-dropdown hidden">
		    <c:if test="${empty alarmList}">
		        <p>📭 받은 알림이 없습니다 📭</p>
		    </c:if>
		
		    <c:forEach var="alarm" items="${alarmList}">
		        <div class="alarm-box">
		            <p>${alarm.content}</p>
		            <a href="javascript:void(0);"
		               onclick="openProfilePopup(
		                   '${alarm.sender.address}',
		                   '${alarm.sender.age}',
		                   '${alarm.sender.hobby}',
		                   '${alarm.sender.religion}',
		                   '${alarm.sender.smoke}',
		                   '${alarm.sender.introduce}',
		                   '${alarm.sender.userId}',
		                   '${alarm.sender.facialType}',
		                   '${alarm.sender.kakaoId}',
		                   '${alarm.matching.matchId}',
		                   '${alarm.matching.status}',
		                   '${alarm.alarmId}',
		                   this
		               )">확인</a>
		
		            <c:if test="${alarm.isChecked eq 'Y'}">
		                <span class="read-label">읽음</span>
		            </c:if>
		        </div>
		    </c:forEach>
		</div>
	</div>
</body>
</html>