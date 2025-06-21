<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/baseInfo.css">
	<script>
       
        const gugunMap = {
        		"서울특별시": ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"],
        	    "부산광역시": ["강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구"],
        	    "대구광역시": ["남구", "달서구", "달성군", "동구", "북구", "서구", "수성구", "중구"],
        	    "인천광역시": ["강화군", "계양구", "미추홀구", "남동구", "동구", "부평구", "서구", "연수구", "옹진군", "중구"],
        	    "광주광역시": ["광산구", "남구", "동구", "북구", "서구"],
        	    "대전광역시": ["대덕구", "동구", "서구", "유성구", "중구"],
        	    "울산광역시": ["남구", "동구", "북구", "울주군", "중구"],
        	    "세종특별자치시": ["세종시"],
        	    "경기도": ["가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"],
        	    "강원도": ["강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군"],
        	    "충청북도": ["괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "증평군", "진천군", "청주시", "충주시"],
        	    "충청남도": ["계룡시", "공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시", "서천군", "아산시", "예산군", "천안시", "청양군", "태안군", "홍성군"],
        	    "전라북도": ["고창군", "군산시", "김제시", "남원시", "무주군", "부안군", "순창군", "완주군", "익산시", "임실군", "장수군", "전주시", "정읍시", "진안군"],
        	    "전라남도": ["강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군", "여수시", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"],
        	    "경상북도": ["경산시", "경주시", "고령군", "구미시", "군위군", "김천시", "문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군", "영양군", "영주시", "영천시", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시"],
        	    "경상남도": ["거제시", "거창군", "고성군", "김해시", "남해군", "밀양시", "사천시", "산청군", "양산시", "의령군", "진주시", "창녕군", "창원시", "통영시", "하동군", "함안군", "함양군", "합천군"],
        	    "제주특별자치도": ["서귀포시", "제주시"]
            };

            function updateGugun() {
                const sido = document.getElementById("sido").value;
                const gugunSelect = document.getElementById("gugun");
                gugunSelect.innerHTML = "<option value=''>구/군 선택</option>";

                if (sido && gugunMap[sido]) {
                    gugunMap[sido].forEach(gugun => {
                        const option = document.createElement("option");
                        option.value = gugun;
                        option.text = gugun;
                        gugunSelect.appendChild(option);
                    });
                }
            }
            
            window.onload = function () {
                // 주소 설정
                document.getElementById("addressForm").addEventListener("submit", function (e) {

                    // ✅ 여기서 address 값 반드시 세팅
                    const sido = document.getElementById("sido").value;
                    const gugun = document.getElementById("gugun").value;
                    document.getElementById("address").value = sido + " " + gugun;
                });
                
             // 🟣 주소에서 시/도, 구/군 분리하여 드롭다운 설정
                const fullAddress = "${user.address}"; // ex. "서울특별시 강남구"
                if (fullAddress) {
                    const [selectedSido, selectedGugun] = fullAddress.split(" ");
                    const sidoSelect = document.getElementById("sido");
                    const gugunSelect = document.getElementById("gugun");

                    // 시도 선택
                    if (selectedSido) {
                        sidoSelect.value = selectedSido;
                        updateGugun(); // 시도 바뀌면 구/군 갱신
                    }

                    // 구군 선택
                    if (selectedGugun) {
                        setTimeout(() => { // 구군 목록 갱신 이후 설정되도록 지연
                            gugunSelect.value = selectedGugun;
                        }, 50);
                    }
                }
            };

    </script>
</head>
<body>
	<div class="container">
	    <div class="header">
	        <div class="logo"><a href="${pageContext.request.contextPath}/user/home" class="homeBtn">Tiki-Taka</a></div>
	        <div class="icons">
	            <a href="${pageContext.request.contextPath}/user/myPage" class="mypageBtn">👤</a>
				<jsp:include page="alarm.jsp" />
	        </div>
	    </div>
	    <form id="addressForm" action="${pageContext.request.contextPath}/mypage/updateAddress" method="post" class="form-layout">
			<div class="content" style="align-items: center;">
			    <div class="title">거주지를 작성해주세요</div>
			    <div class="description">거리가 중요하다면 꼭 작성해주세요<br>거주지는 매칭에 반영됩니다!</div>
			
			    <!-- 🔽 기존 "매칭 이상형 나이 설정" 부분 제거 후, 여기에 주소 입력 드롭다운 삽입 -->
					<div class="input-row" style="margin-top: 30px;">
					    <div class="input-half">
					        <select id="sido" name="sido" class="input-box" onchange="updateGugun()">
					            <option value="">시/도 선택</option>
					            <option value="서울특별시" ${loginUser.address != null && user.address.startsWith('서울특별시') ? 'selected' : ''}>서울특별시</option>
					            <option value="부산광역시" ${loginUser.address != null && user.address.startsWith('부산광역시') ? 'selected' : ''}>부산광역시</option>
					            <option value="대구광역시" $${loginUser.address != null && user.address.startsWith('대구광역시') ? 'selected' : ''}>대구광역시</option>
					            <option value="인천광역시" ${loginUser.address != null && user.address.startsWith('인천광역시') ? 'selected' : ''}>인천광역시</option>
					            <option value="광주광역시" ${loginUser.address != null && user.address.startsWith('광주광역시') ? 'selected' : ''}>광주광역시</option>
					            <option value="대전광역시" ${loginUser.address != null && user.address.startsWith('대전광역시') ? 'selected' : ''}>대전광역시</option>
					            <option value="울산광역시" ${loginUser.address != null && user.address.startsWith('울산광역시') ? 'selected' : ''}>울산광역시</option>
					            <option value="경기도" ${loginUser.address != null && user.address.startsWith('경기도') ? 'selected' : ''}>경기도</option>
					            <option value="강원도" ${loginUser.address != null && user.address.startsWith('강원도') ? 'selected' : ''}>강원도</option>
					            <option value="충청북도" ${loginUser.address != null && user.address.startsWith('충청북도') ? 'selected' : ''}>충청북도</option>
					            <option value="충청남도" ${loginUser.address != null && user.address.startsWith('충청남도') ? 'selected' : ''}>충청남도</option>
					            <option value="전라북도" ${loginUser.address != null && user.address.startsWith('전라북도') ? 'selected' : ''}>전라북도</option>
					            <option value="전라남도" ${loginUser.address != null && user.address.startsWith('전라남도') ? 'selected' : ''}>전라남도</option>
					            <option value="경상북도" ${loginUser.address != null && user.address.startsWith('경상북도') ? 'selected' : ''}>경상북도</option>
					            <option value="경상남도" ${loginUser.address != null && user.address.startsWith('경상북도') ? 'selected' : ''}>경상남도</option>
					            <option value="제주특별자치도" ${loginUser.address != null && user.address.startsWith('제주특별자치도') ? 'selected' : ''}>제주특별자치도</option>
					        </select>
					    </div>
					    <div class="input-half">
					        <select id="gugun" name="gugun" class="input-box">
					            <option value="">구/군 선택</option>
					        </select>
					    </div>
					</div>
					<!-- 최종 전송될 address 값 -->
					<input type="hidden" id="address" name="address">
			</div>
	        <div class="footer">
	            <button type="submit" class="next-button">수정하기</button>
	        </div>
        </form>
     </div>
  
</body>
</html>