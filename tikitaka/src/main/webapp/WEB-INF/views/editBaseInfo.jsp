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

        // 기본정보 입력 확인
        function validateBaseInfo(event) {
            const name = document.getElementById("name").value.trim();
            const age = document.getElementById("age").value.trim();
            const height = document.getElementById("height").value.trim();
            const weight = document.getElementById("weight").value.trim();
            const itAge = document.getElementById("itAge").value.trim();
            const genderRadios = document.getElementsByName("gender");

            let genderSelected = false;
            for (let i = 0; i < genderRadios.length; i++) {
                if (genderRadios[i].checked) {
                    genderSelected = true;
                    break;
                }
            }

            if (!name || !age || !height || !weight || !itAge) {
                alert("모든 기본 정보를 입력해주세요.");
                event.preventDefault();
                return false;
            }

            if (!genderSelected) {
                alert("성별을 선택해주세요.");
                event.preventDefault();
                return false;
            }
        }
        
        // 초기 이벤트 등록
        window.onload = function () {
            document.querySelector("form").addEventListener("submit", validateBaseInfo);
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
	
	    <form class="form-layout" action="${pageContext.request.contextPath}/user/updateBaseInfo" method="post">
	        <div class="content">
	            <div class="input-wrapper">
	                <div class="title">기본정보를 수정해주세요</div>
	
	                <div style="font-size: 16px; margin-top: 50px;">기본정보</div>
	                <input type="text" class="input-box" id="name" name="name" placeholder="이름을 입력해주세요" value="${user.name}">
					
	                <div style="font-size: 16px; margin-top: 15px;">성별</div>
					<div class="radio-wrapper gender-group">
					    <label class="option-button gender-option ${user.gender == 'M' ? 'active' : ''}">
					        남성<input type="radio" name="gender" value="M" ${user.gender == 'M' ? 'checked' : ''} onclick="togglePreference(this, 'gender-option')" hidden>
					    </label>
					    <label class="option-button gender-option ${user.gender == 'F' ? 'active' : ''}">
					        여성<input type="radio" name="gender" value="F" ${user.gender == 'F' ? 'checked' : ''} onclick="togglePreference(this, 'gender-option')" hidden>
					    </label>
					</div>
					
	                <div class="input-row">
	                    <div class="input-half">
	                        <input type="text" class="input-box" id="age" name="age" placeholder="나이" value="${user.age}">
	                    </div>
	                    <div class="input-half">
	                        <input type="text" class="input-box" id="height" name="height" placeholder="키" value="${user.height}">
	                        <span class="suffix-text">cm</span>
	                    </div>
	                </div>
	
	                <div class="input-row">
	                    <div class="input-half">
	                        <input type="text" class="input-box" id="weight" name="weight" placeholder="몸무게" value="${user.weight}">
	                        <span class="suffix-text">kg</span>
	                    </div>
	                    <div class="input-half" style="display: flex; align-items: center;">
	                        <label class="option-button weight-private ${user.weightPrivate == 'Y' ? 'active' : ''}" style="display: flex; align-items: center; gap: 10px;">
	                            <input type="checkbox" name="weightPrivate" value="Y" ${user.weightPrivate == 'Y' ? 'checked' : ''} hidden onclick="toggleWeightPrivacy(this)">
	                            <span>몸무게 비공개</span>
	                        </label>
	                    </div>
	                </div>
	
	                <div style="font-size: 16px; margin-top: 15px;">매칭 이상형 나이 설정</div>
	                <input type="text" class="input-box" id="itAge" name="itAge" placeholder="나이 (예: 22-24)" value="${idealtype.itAge}">
	                <div class="radio-wrapper age-pref-group">
	                    <label class="option-button age-option ${idealtype.agePreference == 'OLDER' ? 'active' : ''}">
	                        연상<input type="radio" name="agePreference" value="OLDER" ${idealtype.agePreference == 'OLDER' ? 'checked' : ''} onclick="togglePreference(this, 'age-option')" hidden>
	                    </label>
	                    <label class="option-button age-option ${idealtype.agePreference == 'SAME' ? 'active' : ''}">
	                        동갑<input type="radio" name="agePreference" value="SAME" ${idealtype.agePreference == 'SAME' ? 'checked' : ''} onclick="togglePreference(this, 'age-option')" hidden>
	                    </label>
	                    <label class="option-button age-option ${idealtype.agePreference == 'YOUNGER' ? 'active' : ''}">
	                        연하<input type="radio" name="agePreference" value="YOUNGER" ${idealtype.agePreference == 'YOUNGER' ? 'checked' : ''} onclick="togglePreference(this, 'age-option')" hidden>
	                    </label>
	                </div>
	            </div>
	        </div>
	
	        <div class="footer">
	            <button type="submit" class="next-button">수정하기</button>
	        </div>
	    </form>
	</div>
</body>
</html>