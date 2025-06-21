<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<div class ="escBtn">
    <img class ="escBtn" src="${pageContext.request.contextPath}/images/escBtn.png" 
        alt="profile image" onclick="window.closePopup()">
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
    <p class="infoResult">
	    <c:forEach var="h" items="${userInfo.hobby}" varStatus="s">
	        ${h}<c:if test="${!s.last}"> | </c:if>
	    </c:forEach>
	</p>

    <p class="infoType">종교·흡연</p>
    <p class="infoResult">${userInfo.religion} | ${userInfo.smoke}</p>

    <p class="infoType">한줄소개</p>
    <p class="infoIntroduce">${userInfo.introduce}</p>
</div>
<c:choose>
    <c:when test="${status eq 'REQUESTED'}">
        <c:choose>
            <%-- 이미 응답한 매칭이면 메시지 출력 --%>
            <c:when test="${responded}">
                <div class="matching-result-message">
                    <p class="pending">⏳ 매칭 신청 중입니다 ⏳</p>
                </div>
            </c:when>
            <%-- 아직 응답하지 않은 경우 버튼 출력 --%>
            <c:otherwise>
                <div class="button-group">
                    <form action="${pageContext.request.contextPath}/match/sendRequest" method="post">
                        <input type="hidden" name="matchedUserId" value="${userInfo.userId}" />
                        <input type="hidden" name="matchId" value="${matchId}" />
                        <button type="submit" class="match-btn">매칭하기</button>
                    </form>

                    <form action="${pageContext.request.contextPath}/match/sendRejected" method="post">
                        <input type="hidden" name="matchId" value="${matchId}" />
                        <button type="submit" class="reject-btn">거절하기</button>
                    </form>
                </div>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:otherwise>
        <div class="matching-result-message">
			<c:if test="${status eq 'ACCEPTED'}">
			    <div class="accepted-box">
			        <div class="accepted-top">
			            <p class="accepted-emoji">😊 매칭이 성사되었어요! 😊</p>
			        </div>
			        <div class="kakao-box">
			            <p class="kakao-label">매칭된 상대의 카카오톡 아이디</p>
			            <p class="kakao-id">${userInfo.kakaoId}</p>
			        </div>
			    </div>
			</c:if>
            <c:if test="${status eq 'REJECTED'}">
                <p class="rejected">😢 매칭이 성사되지 못했어요 😢</p>
            </c:if>
        </div>
    </c:otherwise>
</c:choose>