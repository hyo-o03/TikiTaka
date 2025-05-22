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

        // 매칭 이상형 라디오 버튼 스타일 변경
        function togglePreference(radio) {       
            const label = radio.parentElement;
            if (radio.checked) {
                document.querySelectorAll('.option-button').forEach(el => el.classList.remove('active'));
                label.classList.add("active");
            }
        }
    </script>
</head>
<body>
<div class="container">
    <div class="header">
        <img src="${pageContext.request.contextPath}/images/leftBtn.png">
        <img src="${pageContext.request.contextPath}/images/escBtn.png">
    </div>

    <form class="form-layout" action="${pageContext.request.contextPath}/signup/signupSuccess" method="post">
        <div class="content">
            <div class="input-wrapper">
                <div class="title">기본정보를 입력해주세요</div>

                <div style="font-size: 16px; margin-top: 50px;">기본정보</div>
                <input type="text" class="input-box" placeholder="이름을 입력해주세요">

                <div class="input-row">
                    <div class="input-half">
                        <input type="text" class="input-box" placeholder="나이">
                    </div>
                    <div class="input-half">
                        <input type="text" class="input-box" placeholder="키">
                        <span class="suffix-text">cm</span>
                    </div>
                </div>

                <div class="input-row">
                    <div class="input-half">
                        <input type="text" class="input-box" placeholder="몸무게">
                        <span class="suffix-text">kg</span>
                    </div>
                    <div class="input-half" style="display: flex; align-items: center;">
                        <label class="option-button" style="display: flex; align-items: center; gap: 10px;">
                            <input type="checkbox" hidden onclick="toggleWeightPrivacy(this)">
                            <span>몸무게 비공개</span>
                        </label>
                    </div>
                </div>

                <div style="font-size: 16px; margin-top: 15px;">매칭 이상형 나이 설정</div>
                <input type="text" class="input-box" placeholder="나이 (예: 22-24)">
                <div class="radio-wrapper">
                    <label class="option-button">연상<input type="radio" name="preference" onclick="togglePreference(this)" hidden></label>
                    <label class="option-button">동갑<input type="radio" name="preference" onclick="togglePreference(this)" hidden></label>
                    <label class="option-button">연하<input type="radio" name="preference" onclick="togglePreference(this)" hidden></label>
                </div>
            </div>
        </div>

        <div class="footer">
            <button type="submit" class="next-button">다음단계</button>
        </div>
    </form>
</div>
</body>
</html>