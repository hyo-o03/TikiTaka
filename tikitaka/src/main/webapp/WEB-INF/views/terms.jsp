<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>이용약관 동의</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/terms.css">
    <meta charset="UTF-8">
	<script>
		function toggleCheck(checkbox, inputId) {
			const active = checkbox.classList.toggle("active");
			document.getElementById(inputId).value = active ? "Y" : "N";
		}
		
		function toggleAll(el) {
			const isActive = el.classList.contains("active");
			const allCheckboxes = document.querySelectorAll(".custom-checkbox");
			const agreeInputs = document.querySelectorAll("input[type=hidden]");
		
			allCheckboxes.forEach((box, idx) => {
				if (idx === 0) return; // "모두 동의" 제외
				if (!isActive) {
					box.classList.add("active");
					agreeInputs[idx - 1].value = "Y";
				} else {
					box.classList.remove("active");
					agreeInputs[idx - 1].value = "N";
				}
			});
		
			// toggle "모두 동의" 상태
			el.classList.toggle("active");
		}
	</script>
</head>
<body>
<div class="container">
    <div class="header">
        <img src="${pageContext.request.contextPath}/images/leftBtn.png">
        <img src="${pageContext.request.contextPath}/images/escBtn.png">
    </div>

    <form action="${pageContext.request.contextPath}/signup/verifyCode" method="post" class="form-layout">
        <div class="content">
            <div class="title">약관에 동의해주세요</div>
            <div class="description">
                전체 동의는 필수 및 선택 항목에 대한 동의도 포함되어 있습니다.<br>
                개별적으로 동의를 선택하실 수 있습니다.
            </div>

            <!-- 모두 동의 -->
            <div class="checkbox-container">
            		<!-- ✅ 모두 동의 -->
				<label class="custom-checkbox">
					<input type="checkbox" name="agreeAll" onclick="toggleAll(this)">
					<span class="checkbox-text">전체 동의</span>
				</label>
				
				<hr>
	
				<label class="custom-checkbox">
					<input type="checkbox" name="agree1" class="custom-checkbox">
					<span class="checkbox-text">만 18세 이상입니다</span>
				</label>
		
				<label class="custom-checkbox">
					<input type="checkbox" name="agree2" class="custom-checkbox">
					<span class="checkbox-text">서비스 이용약관 동의</span>
				</label>
		
				<label class="custom-checkbox">
					<input type="checkbox" name="agree3" class="custom-checkbox">
					<span class="checkbox-text">개인정보 수집 및 이용 동의</span>
				</label>
		
				<label class="custom-checkbox optional">
					<input type="checkbox" name="agree4" class="custom-checkbox">
					<span class="checkbox-text">알림 또는 이벤트 정보 수신 동의 (선택)</span>
				</label>
            </div>

            <!-- 전송용 hidden input -->
            <input type="hidden" name="agree1" id="agree1" value="N">
            <input type="hidden" name="agree2" id="agree2" value="N">
            <input type="hidden" name="agree3" id="agree3" value="N">
            <input type="hidden" name="agree4" id="agree4" value="N">
        </div>
        
                <!-- 버튼 -->
        <div class="footer">
            <button type="submit" class="next-button">다음단계</button>
        </div>
    </form>
</div>
</body>
</html>