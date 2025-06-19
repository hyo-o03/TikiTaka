<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/terms.css">
    <meta charset="UTF-8">
	<script>
	
	    // 체크 여부에 따라 hidden input의 값을 Y 또는 N으로 설정
	    function updateHidden(name, isChecked) {
	        document.getElementById(name).value = isChecked ? "Y" : "N";
	    }
    
	 	// 개별 약관 체크 시 동작
	    function toggleIndividual(checkbox) {
	    	const hiddenName = checkbox.id.replace("_check", ""); // ex. agree4_check → agree4
	        const isChecked = checkbox.checked;
	        updateHidden(hiddenName, isChecked); // hidden input 업데이트

	        // 하나라도 해제되면 "전체 동의" 체크 해제
	        if (!isChecked) {
	        	document.getElementById("agreeAll_check").checked = false;
	        }

	        // 4개 모두 체크되면 "전체 동의"도 체크
	        const allChecked = ["agree1", "agree2", "agree3", "agree4"].every(id =>
	            document.getElementById(id + "_check").checked
	        );
	        if (allChecked) {
	            document.getElementById("agreeAll_check").checked = true;
	        }
	    }

	    // 필수 약관(agree1~3)이 모두 체크되지 않으면 제출 막기
	    function validateTerms(event) {
	        const required = ["agree1", "agree2", "agree3"];
	        for (let name of required) {
	            if (document.getElementById(name).value !== "Y") {
	                alert("필수 약관(만 18세 이상, 서비스 이용약관, 개인정보 수집 동의)에 모두 동의해야 합니다.");
	                event.preventDefault(); // form 제출 막기
	                return false;
	            }
	        }
	    }
		
	    function toggleAll(masterCheckbox) {
	        const isChecked = masterCheckbox.checked;

	        const checkboxNames = ["agree1", "agree2", "agree3", "agree4"];
	        checkboxNames.forEach(name => {
	        	const cb = document.getElementById(name + "_check");
	            cb.checked = isChecked;
	            updateHidden(name, isChecked);
	        });
	    }
		
		// 페이지 로딩 시 이벤트 리스너 연결
	    window.onload = () => {
	    	document.getElementById("agreeAll_check").addEventListener("change", function () {
	            toggleAll(this);
	        });

	        ["agree1", "agree2", "agree3", "agree4"].forEach(name => {
	            document.getElementById(name + "_check").addEventListener("change", function () {
	                toggleIndividual(this);
	            });
	        });

	        document.querySelector("form").addEventListener("submit", validateTerms);
	    };
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
					<input type="checkbox" id="agreeAll_check" name="agreeAll" onclick="toggleAll(this)">
					<span class="checkbox-text">전체 동의</span>
				</label>
				
				<hr>
	
				<label class="custom-checkbox">
					<input type="checkbox" id="agree1_check" name="agree1_check">
					<span class="checkbox-text">만 18세 이상입니다</span>
				</label>
		
				<label class="custom-checkbox">
					<input type="checkbox" id="agree2_check" name="agree2_check">
					<span class="checkbox-text">서비스 이용약관 동의</span>
				</label>
		
				<label class="custom-checkbox">
					<input type="checkbox" id="agree3_check" name="agree3_check">
					<span class="checkbox-text">개인정보 수집 및 이용 동의</span>
				</label>
		
				<label class="custom-checkbox optional">
					<input type="checkbox" id="agree4_check" name="agree4_check">
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