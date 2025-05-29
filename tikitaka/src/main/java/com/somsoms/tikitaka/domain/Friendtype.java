package com.somsoms.tikitaka.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table(name="FRIENDTYPE")
public class Friendtype {

    /* Private Fields */
	
    // db 자동 생성
    @Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "friend_id_seq")
	@SequenceGenerator(name = "friend_id_seq", sequenceName = "FRIEND_SEQ", allocationSize = 1)
    @Column(name = "FT_ID")
    private int ftId;

    @ManyToOne
    @JoinColumn(name = "ID", nullable = false)  // 외래키 → User 테이블
    private User user;

    @Column(name = "FT_AGE")
    private int ftAge;

    @Column(name = "FT_MBTI", length = 5)
    private String ftMbti;

    @Column(name = "FT_HOBBY", length = 10)
    private String ftHobby;

    @Column(name = "FT_ADDRESS", length = 10)
    private String ftAddress;

    @Column(name = "FT_SMOKE")
    private boolean ftSmoke;

    /* Constructors */
    
    Friendtype() {}

    /* JavaBeans Properties */
    
    public int getFtId() { return ftId; }
    public void setFtId(int ftId) { this.ftId = ftId; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
    public int getFtAge() { return ftAge; }
    public void setFtAge(int ftAge) { this.ftAge = ftAge; }
    public String getFtMbti() { return ftMbti; }
    public void setFtMbti(String ftMbti) { this.ftMbti = ftMbti; }
    public String getFtHobby() { return ftHobby; }
    public void setFtHobby(String ftHobby) { this.ftHobby = ftHobby; }
    public String getFtAddress() { return ftAddress; }
    public void setFtAddress(String ftAddress) { this.ftAddress = ftAddress; }
	public boolean isFtSmoke() { return ftSmoke; }
	public void setFtSmoke(boolean ftSmoke) { this.ftSmoke = ftSmoke; }
    
}