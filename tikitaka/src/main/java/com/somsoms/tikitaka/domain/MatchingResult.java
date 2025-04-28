package com.somsoms.tikitaka.domain;

import java.util.Date;

public class MatchingResult {

    /* Private Fields */
	
    // db 자동 생성
    private int resultId;
    // User class 참조(user_id 필요)
    private User user;
    private String requestType;
    private Date requestTime;

    /* Constructors */
    
    MatchingResult() {}

    /* JavaBeans Properties */
    
    public int getResultId() { return resultId; }
    public void setResultId(int resultId) { this.resultId = resultId; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
    public String getRequestType() { return requestType; }
    public void setRequestType(String requestType) { this.requestType = requestType; }
    public Date getRequestTime() { return requestTime; }
    public void setRequestTime(Date requestTime) { this.requestTime = requestTime; }
    
}