<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/matchRequestDone.css">
    <title>Tiki Taka</title>
</head>
<body>
<div class="container">
    <div class="header">
        <img src="${pageContext.request.contextPath}/images/leftBtn.png">
        <img src="${pageContext.request.contextPath}/images/escBtn.png">
    </div>
    <div class="body">
        <div>
            <p class="title">매칭이 신청됐어요</p>
            <p class="subTitle">
                매칭 신청이 완료되었어요.<br>
                결과는 금일 오후 10시에 확인할 수 있어요
            </p>
        </div>
        <div>
            <img class="completeImg" src="/images/applicationComplete.png">
        </div>
        <div class="footer">
            <button class="okBtn">확인</button>
        </div>
    </div>
</div>
</body>
</html>
