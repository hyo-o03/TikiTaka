<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ageForm.css">
    <script>
		function exit() {
		    if (confirm("수정을 취소하시겠습니까?")) {
		        window.location.href = "${pageContext.request.contextPath}/mypage/mypage";
		    }
		}
		
		window.onload = function () {
	        const mbtiDropdown = document.getElementById("mbtiSelect");
	        const unknownBtn = document.getElementById("unknownOption");

	        // 몰라요 버튼 클릭 시
	        unknownBtn.addEventListener("click", function () {
	            mbtiDropdown.selectedIndex = 0; // "선택하기"로 초기화
	            unknownBtn.classList.add("selected");
	        });

	        // 드롭다운에서 선택 시
	        mbtiDropdown.addEventListener("change", function () {
	            if (mbtiDropdown.value !== "") {
	                unknownBtn.classList.remove("selected");
	            }
	        });
	    };
	</script>
</head>
<body>
	<div class="container">
	    <div class="header">
	        <img src="${pageContext.request.contextPath}/images/leftBtn.png" onclick="history.back()">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png" onclick="exit()">
	    </div>
	    <form action="${pageContext.request.contextPath}/friend/friendAddress" method="post" class="form-layout">
		<div class="content">
		    <div class="title">당신과 당신의 친구의 나이 차이는 어느 정도였으면 좋겠나요?</div>
		    <div class="description">연상 혹은 연하를 고르신 분들은 그 아래 정확한 나이차이까지 골라주세요</div>
		
		    <div class="age-select-wrapper">
		        <select class="ageDif-dropdown" name="ageDif" id="ageDifSelect">
		            <option ${friend.ftAgePreference == 'up' ? 'selected' : ''} value="up">연상</option>
					<option ${friend.ftAgePreference == 'down' ? 'selected' : ''} value="down">연하</option>
					<option ${friend.ftAgePreference == 'same' ? 'selected' : ''} value="same">동갑</option>
					<option ${(empty friend.ftAgePreference || friend.ftAgePreference == 'both') ? 'selected' : ''} value="both">상관없음</option>
		        </select>
		
				<select class="age-dropdown" name="age" id="ageSelect">
					<option value="1" ${friend.ftAge == '1' ? 'selected' : ''}>1살</option>
					<option value="2" ${friend.ftAge == '2' ? 'selected' : ''}>2살</option>
					<option value="3" ${friend.ftAge == '3' ? 'selected' : ''}>3살</option>
					<option value="4" ${friend.ftAge == '4' ? 'selected' : ''}>4살</option>
					<option value="5" ${friend.ftAge == '5' ? 'selected' : ''}>5살</option>
					<option value="6" ${friend.ftAge == '6' ? 'selected' : ''}>6살</option>
					<option value="7" ${friend.ftAge == '7' ? 'selected' : ''}>7살 이상</option>
					<option value="0" ${(empty friend.ftAge || friend.ftAge == '0') ? 'selected' : ''}>상관없음</option>
				</select>
		    </div>
		</div>
        <div class="footer">
            <button type="submit" class="next-button">다음단계</button>
        </div>
        </form>
	</div>
</body>
</html>