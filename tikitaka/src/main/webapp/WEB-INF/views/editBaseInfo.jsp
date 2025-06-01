<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>기본정보</title>
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
            <a href="${pageContext.request.contextPath}/user/alarm" class="alarmBtn">🔔</a>
        </div>
    </div>

    <form class="form-layout" action="${pageContext.request.contextPath}/mypage/editFormMenu" method="post">
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
				    <label class="option-button">
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
                            <input type="checkbox" id="weightPrivate name="weightPrivate" hidden onclick="toggleWeightPrivacy(this)">
                            <span>몸무게 비공개</span>
                        </label>
                    </div>
                </div>

                <div style="font-size: 16px; margin-top: 15px;">매칭 이상형 나이 설정</div>
                <input type="text" class="input-box" id="itAge" name="itAge" placeholder="나이 (예: 22-24)">
                <div class="radio-wrapper age-pref-group">
                    <label class="option-button age-option">연상<input type="radio" id="agePreference" name="agePreference" value="OLDER" onclick="togglePreference(this, 'age-option')" hidden></label>
                    <label class="option-button age-option">동갑<input type="radio" id="agePreference" name="agePreference" value="SAME" onclick="togglePreference(this, 'age-option')" hidden></label>
                    <label class="option-button age-option">연하<input type="radio" id="agePreference" name="agePreference" value="YOUNGER" onclick="togglePreference(this, 'age-option')" hidden></label>
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