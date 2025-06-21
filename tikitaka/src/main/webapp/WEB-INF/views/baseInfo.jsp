<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/baseInfo.css">
    <meta charset="UTF-8">
    <script>
		function exit() {
		    if (confirm("설문 작성을 취소하시겠습니까?")) {
		        window.location.href = "${pageContext.request.contextPath}/signup/start";
		    }
		}
        // 몸무게 비공개 체크박스 스타일 변경
        function toggleWeightPrivacy(checkbox) {
            const label = checkbox.parentElement;
            label.classList.toggle("active", checkbox.checked);
        }
        
        // 공통 라디오 버튼 스타일 변경 함수 (클래스 구분)
        function togglePreference(radio, groupClass) {
            const label = radio.parentElement;
            if (radio.checked) {
                document.querySelectorAll('.' + groupClass).forEach(el => el.classList.remove('active'));
                label.classList.add("active");
            }
        }
        
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
                document.getElementById("baseInfoForm").addEventListener("submit", function (e) {
                	// ✅ validate 먼저 수행
                    if (!validateBaseInfo(e)) return;

                    // ✅ 여기서 address 값 반드시 세팅
                    const sido = document.getElementById("sido").value;
                    const gugun = document.getElementById("gugun").value;
                    document.getElementById("address").value = sido + " " + gugun;
                });
            };

         // 기본정보 입력 확인
        function validateBaseInfo(event) {
            const name = document.getElementById("name").value.trim();
            const age = document.getElementById("age").value.trim();
            const height = document.getElementById("height").value.trim();
            const weight = document.getElementById("weight").value.trim();
            const genderRadios = document.getElementsByName("gender");
            const sido = document.getElementById("sido").value;
            const gugun = document.getElementById("gugun").value;

         // 성별: M 또는 F 중 하나가 반드시 선택되어야 함
            let gender = null;
            for (let i = 0; i < genderRadios.length; i++) {
                if (genderRadios[i].checked) {
                    gender = genderRadios[i].value;
                    break;
                }
            }

            if (!name || !age || !height || !weight) {
                alert("모든 기본 정보를 입력해주세요.");
                event.preventDefault();
                return false;
            }

            if (gender !== "M" && gender !== "F") {
                alert("성별을 선택해주세요.");
                event.preventDefault();
                return false;
            }
            
            if (sido == "" || gugun == "") {
                alert("거주 지역을 선택해주세요.");
                event.preventDefault();
                return false;
            }
            
            return true; // ✅ 유효성 검사 통과 시 true 반환
        } 
    </script>
</head>
<body>
	<div class="container">
	    <div class="header">
	        <img src="${pageContext.request.contextPath}/images/leftBtn.png" onclick="history.back()">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png" onclick="exit()">
	    </div>
	
	    <form id="baseInfoForm" class="form-layout" action="${pageContext.request.contextPath}/signup/signupSuccess" method="post">
	        <div class="content">
	            <div class="input-wrapper">
	                <div class="title">기본정보를 입력해주세요</div>
	
	                <div style="font-size: 16px; margin-top: 50px;">기본정보</div>
	                <input type="text" class="input-box" id="name" name="name" placeholder="이름을 입력해주세요">
					<div style="font-size: 16px; margin-top: 15px;">성별</div>
					<div class="radio-wrapper gender-group">
					    <label class="option-button gender-option">
					        남성<input type="radio" id="gender" name="gender" value="M" onclick="togglePreference(this, 'gender-option')" hidden>
					    </label>
					    <label class="option-button gender-option">
					        여성<input type="radio" id="gender" name="gender" value="F" onclick="togglePreference(this, 'gender-option')" hidden>
					    </label>
					</div>
	                <div class="input-row">
	                    <div class="input-half">
	                        <input type="text" class="input-box" id="age" name="age" placeholder="나이">
	                    </div>
	                    <div class="input-half">
	                        <input type="text" class="input-box" id="height" name="height" placeholder="키">
	                        <span class="suffix-text">cm</span>
	                    </div>
	                </div>
	
	                <div class="input-row">
	                    <div class="input-half">
	                        <input type="text" class="input-box" id="weight" name="weight" placeholder="몸무게">
	                        <span class="suffix-text">kg</span>
	                    </div>
	                    <div class="input-half" style="display: flex; align-items: center;">
	                        <label class="option-button weight-private" style="display: flex; align-items: center; gap: 10px;">
	                            <input type="checkbox" id="weightPrivate" name="weightPrivate" onclick="toggleWeightPrivacy(this)" hidden>
	                            <span>몸무게 비공개</span>
	                        </label>
	                    </div>
	                </div>
	
					<!--  이상형부분 수정
	                <div style="font-size: 16px; margin-top: 15px;">매칭 이상형 나이 설정</div>
	                <input type="text" class="input-box" id="itAge" name="itAge" placeholder="나이 (예: 22-24)">
	                <div class="radio-wrapper age-pref-group">
	                    <label class="option-button age-option">연상<input type="radio" id="agePreference" name="agePreference" value="OLDER" onclick="togglePreference(this, 'age-option')" hidden></label>
	                    <label class="option-button age-option">동갑<input type="radio" id="agePreference" name="agePreference" value="SAME" onclick="togglePreference(this, 'age-option')" hidden></label>
	                    <label class="option-button age-option">연하<input type="radio" id="agePreference" name="agePreference" value="YOUNGER" onclick="togglePreference(this, 'age-option')" hidden></label>
	                </div>
	                -->
	                
	                <!-- 🔽 기존 "매칭 이상형 나이 설정" 부분 제거 후, 여기에 주소 입력 드롭다운 삽입 -->
					<div style="font-size: 16px; margin-top: 30px;">내 거주 지역</div>
					<div class="input-row">
					    <div class="input-half">
					        <select id="sido" name="sido" class="input-box" onchange="updateGugun()">
					            <option value="">시/도 선택</option>
					            <option value="서울특별시">서울특별시</option>
					            <option value="부산광역시">부산광역시</option>
					            <option value="대구광역시">대구광역시</option>
					            <option value="인천광역시">인천광역시</option>
					            <option value="광주광역시">광주광역시</option>
					            <option value="대전광역시">대전광역시</option>
					            <option value="울산광역시">울산광역시</option>
					            <option value="경기도">경기도</option>
					            <option value="강원도">강원도</option>
					            <option value="충청북도">충청북도</option>
					            <option value="충청남도">충청남도</option>
					            <option value="전라북도">전라북도</option>
					            <option value="전라남도">전라남도</option>
					            <option value="경상북도">경상북도</option>
					            <option value="경상남도">경상남도</option>
					            <option value="제주특별자치도">제주특별자치도</option>
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
	        </div>
	
	        <div class="footer">
	            <button type="submit" class="next-button">다음단계</button>
	        </div>
	    </form>
	</div>
</body>
</html>