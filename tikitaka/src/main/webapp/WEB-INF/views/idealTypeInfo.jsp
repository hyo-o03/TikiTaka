<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<div class ="escBtn">
    <img class ="escBtn" src="${pageContext.request.contextPath}/images/escBtn.png" 
        alt="profile image" onclick="window.closePopup()">
</div>

<div class="mProfileImg">
</div>
<div class="profileInfo">
    <div class="infoFacial">
		<c:choose>
		    <c:when test="${userInfo.facialType eq '고양이'}"><p>🐱</p></c:when>
		    <c:when test="${userInfo.facialType eq '강아지'}"><p>🐶</p></c:when>
		    <c:when test="${userInfo.facialType eq '햄스터'}"><p>🐹</p></c:when>
		    <c:when test="${userInfo.facialType eq '토끼'}"><p>🐰</p></c:when>
		    <c:when test="${userInfo.facialType eq '곰'}"><p>🐻</p></c:when>
		    <c:when test="${userInfo.facialType eq '늑대'}"><p>🐺</p></c:when>
		</c:choose>
    </div>
    
    <p class="basigInfo">기본정보</p>

    <p class="infoType">거주지·나이</p>
    <p class="infoResult">${userInfo.address} | ${userInfo.age}</p>

    <p class="infoType">관심사</p>
    <p class="infoResult">우주 | 반려동물</p>

    <p class="infoType">종교·흡연</p>
    <p class="infoResult">무교 | 흡연</p>

    <p class="infoType">한줄소개</p>
    <p class="infoIntroduce">${userInfo.introduce}</p>
</div>
<div class="matchingBtn">
    <a href="${pageContext.request.contextPath}/match/isMatchingResultPage?userId=${type.userId}&matchedUserId=${userInfo.userId}">
        <button>매칭하기</button>
    </a>
</div>