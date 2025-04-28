package com.somsoms.tikitaka.domain;

import java.util.Date;

public class Matching {

    /* Private Fields */
	
    // db 자동 생성
    private int matchId;
    // MatchingResult class 참조
    private MatchingResult matchingResult;
    // User class 참조(user_id 필요)
    private User user;
    private int matchedUserId;
    private String status;
    private Date respondTime;

    /* Constructors */
    
    Matching() {}

    /* JavaBeans Properties */
    
    public int getMatchId() { return matchId; }
    public void setMatchId(int matchId) { this.matchId = matchId; }
    public MatchingResult getMatchingResult() { return matchingResult; }
    public void setMatchingResult(MatchingResult matchingResult) { this.matchingResult = matchingResult; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
    public int getMatchedUserId() { return matchedUserId; }
    public void setMatchedUserId(int matchedUserId) { this.matchedUserId = matchedUserId; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public Date getRespondTime() { return respondTime; }
    public void setRespondTime(Date respondTime) { this.respondTime = respondTime; }
    
}