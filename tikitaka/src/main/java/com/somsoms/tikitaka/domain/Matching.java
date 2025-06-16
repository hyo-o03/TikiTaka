package com.somsoms.tikitaka.domain;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name="MATCHING")
public class Matching {

    /* Private Fields */
    
    // db 자동 생성
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "match_id_seq")
    @SequenceGenerator(name = "match_id_seq", sequenceName = "MATCH_SEQ", allocationSize = 1)
    @Column(name = "MATCH_ID")
    private int matchId;

    @ManyToOne
    @JoinColumn(name = "RESULT_ID", nullable = false)
    private MatchingResult matchingResult;

    @ManyToOne
    @JoinColumn(name = "ID", nullable = false)  // 실제 User 테이블의 PK 컬럼명과 맞게
    private User user;

    @Column(name = "MATCHED_USER_ID", nullable = false)
    private int matchedUserId;

    @Column(name = "STATUS", length = 20)
    private String status;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "RESPOND_TIME")
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