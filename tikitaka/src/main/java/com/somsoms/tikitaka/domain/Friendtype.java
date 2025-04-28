package com.somsoms.tikitaka.domain;

public class Friendtype {

    /* Private Fields */
	
    // db 자동 생성
    private int ftId;
    private User user;
    private int ftAge;
    private String ftMbti;
    private String ftHobby;
    private String ftAddress;

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

}