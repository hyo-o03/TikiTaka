<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPage.css">
    <meta charset="UTF-8">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
	    function handleLogout(event) {
	        event.preventDefault(); // 기본 링크 동작 막기
	
	        Swal.fire({
	            title: '👋 로그아웃 하시겠습니까?',
	            text:  '언제든 다시 돌아오세요!',
	            icon: null,
	            showCancelButton: true,
	            confirmButtonText: '예',
	            cancelButtonText: '아니오',
	            buttonsStyling: false,  // 기본 스타일 제거
	                backdrop: true,               // 배경 어둡게 유지
	                showClass: {                   // 팝업 애니메이션
	                    popup: 'swal2-noanimation'
	                },
	                // ✅ 여기에 직접 스타일 적용
	                customClass: {
	                    confirmButton: 'swal-next-button',
	                    cancelButton: 'swal-cancel-button',
	                    popup: 'swal-popup-custom'
	                }
	        }).then((result) => {
	            if (result.isConfirmed) {
	                window.location.href = '${pageContext.request.contextPath}/user/logout';
	            }
	        });
	    }
	
	    function handleDelete(event) {
	        event.preventDefault();
	
	        Swal.fire({
	            title: '💔 정말 탈퇴하시겠습니까?',
	            text: "한 번 탈퇴하면 되돌릴 수 없어요.",
	            icon: null,
	            showCancelButton: true,
	            confirmButtonText: '탈퇴하기',
	            cancelButtonText: '취소',
	            buttonsStyling: false,  // 기본 스타일 제거
	                backdrop: true,               // 배경 어둡게 유지
	                showClass: {                   // 팝업 애니메이션
	                    popup: 'swal2-noanimation'
	                },
	                // ✅ 여기에 직접 스타일 적용
	                customClass: {
	                    confirmButton: 'swal-next-button',
	                    cancelButton: 'swal-cancel-button',
	                    popup: 'swal-popup-custom'
	                }
	        }).then((result) => {
	            if (result.isConfirmed) {
	                window.location.href = '${pageContext.request.contextPath}/user/deleteComplete';
	            }
	        });
	    }
	</script>

</head>
<body>
<div class="wrapper">
<div class="container">
    <div class="header">
        <div class="logo"><a href="${pageContext.request.contextPath}/user/home" class="homeBtn">Tiki-Taka</a></div>
        <div class="icons">
            <a href="${pageContext.request.contextPath}/user/myPage" class="mypageBtn">👤</a>
            <jsp:include page="alarm.jsp" />
        </div>
    </div>

    <div class="mypage">
        <div class="user-info">
        	<c:set var="bgColor" value="#eeeeee" />
			<c:choose>
			    <c:when test="${loginUser.facialType eq '고양이'}"><c:set var="bgColor" value="#fff9c4" /></c:when>
			    <c:when test="${loginUser.facialType eq '강아지'}"><c:set var="bgColor" value="#ffecb3" /></c:when>
			    <c:when test="${loginUser.facialType eq '햄스터'}"><c:set var="bgColor" value="#fce4ec" /></c:when>
			    <c:when test="${loginUser.facialType eq '토끼'}"><c:set var="bgColor" value="#f8bbd0" /></c:when>
			    <c:when test="${loginUser.facialType eq '곰'}"><c:set var="bgColor" value="#bbdefb" /></c:when>
			    <c:when test="${loginUser.facialType eq '늑대'}"><c:set var="bgColor" value="#cfd8dc" /></c:when>
			</c:choose>
			
			<div class="avatar" style="background-color: ${bgColor};">
			    <c:choose>
			        <c:when test="${loginUser.facialType eq '고양이'}">&#x1F431;</c:when>
			        <c:when test="${loginUser.facialType eq '강아지'}">&#x1F436;</c:when>
			        <c:when test="${loginUser.facialType eq '햄스터'}">&#x1F439;</c:when>
			        <c:when test="${loginUser.facialType eq '토끼'}">	&#x1F430;</c:when>
			        <c:when test="${loginUser.facialType eq '곰'}">&#x1F43B;</c:when>
			        <c:when test="${loginUser.facialType eq '늑대'}">&#x1F43A;</c:when>
			        <c:otherwise>❓</c:otherwise>
			    </c:choose>
			</div>
            <div class="userid">
                <c:out value="${loginUser.name}" />
            </div>
        </div>

        <div class="section">
            <h3>개인 정보</h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/mypage/editPassword">비밀번호 변경 <span class="arrow">›</span></a></li>
                <li><a href="${pageContext.request.contextPath}/mypage/editBaseInfo">기본정보 변경 <span class="arrow">›</span></a></li>
            </ul>
        </div>
        
        <hr>

        <div class="section">
            <h3>내 프로필</h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/mypage/editFormMenu">매칭 정보 변경 <span class="arrow">›</span></a></li>
            </ul>
        </div>

        <div class="section">
            <h3>이상형 프로필</h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/friend/friendAge">동성친구 매칭 정보 설정 <span class="arrow">›</span></a></li>
                <li><a href="${pageContext.request.contextPath}/ideal/idealAnimalProfile">이성친구 매칭 정보 설정 <span class="arrow">›</span></a></li>
			</ul>
        </div>
        
        <div class="section">
            <h3>회원 관리</h3>
            <ul>
		        <li><a href="${pageContext.request.contextPath}/user/logout" onclick="handleLogout(event)">로그아웃 <span class="arrow">›</span></a></li>
		        <li><a href="${pageContext.request.contextPath}/user/deleteComplete" onclick="handleDelete(event)">회원탈퇴 <span class="arrow">›</span></a></li>
			</ul>
        </div>
    </div>
</div>    
</div>
</body>
</html>