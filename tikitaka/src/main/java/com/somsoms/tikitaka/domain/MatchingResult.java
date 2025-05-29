package com.somsoms.tikitaka.domain;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;

@Entity
@Table(name="MATCHINGRESULT")
public class MatchingResult {

    /* Private Fields */
	
    // db 자동 생성
    @Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "result_id_seq")
	@SequenceGenerator(name = "result_id_seq", sequenceName = "MATCHING_RESULT_SEQ", allocationSize = 1)
    @Column(name = "RESULT_ID")
    private int resultId;

    @ManyToOne
    @JoinColumn(name = "ID", nullable = false)  // 외래키 → User 테이블
    private User user;

    @Column(name = "REQUEST_TYPE", length = 2, nullable = false)
    private String requestType;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "REQUEST_TIME", nullable = false)
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