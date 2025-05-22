<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="mProfileImg">
    <img src="${idealType.imageUrl}" alt="profile image">
</div>
<div class="profileInfo">
    <p class="basigInfo">기본정보</p>

    <p class="infoType">거주지·나이</p>
    <p class="infoResult">${idealType.place} | ${idealType.age}</p>

    <p class="infoType">관심사</p>
    <p class="infoResult">우주 | 반려동물</p>

    <p class="infoType">종교·흡연</p>
    <p class="infoResult">무교 | 흡연</p>

    <p class="infoType">한줄소개</p>
    <p class="infoIntroduce">${idealType.introduce}</p>
</div>
<div class="matchingBtn">
    <button>매칭하기</button>
</div>