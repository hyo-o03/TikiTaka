package com.somsoms.tikitaka.domain;

public class Idealtype {

    /* Private Fields */
	
    // db 자동 생성
    private int itId;
    private User user;
    private int itAge;
    private double itHeight;
    private String itMbti;
    private String itAddress;
    private String itFacialtype;
    private String itFashion;
    private boolean itSmoke;
    private String itHobby;

    /* Constructors */
    
    Idealtype() {}

    /* JavaBeans Properties */
    
    public int getItId() { return itId; }
    public void setItId(int itId) { this.itId = itId; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
    public int getItAge() { return itAge; }
    public void setItAge(int itAge) { this.itAge = itAge; }
    public double getItHeight() { return itHeight; }
    public void setItHeight(double itHeight) { this.itHeight = itHeight; }
    public String getItMbti() { return itMbti; }
    public void setItMbti(String itMbti) { this.itMbti = itMbti; }
    public String getItAddress() { return itAddress; }
    public void setItAddress(String itAddress) { this.itAddress = itAddress; }
    public String getItFacialtype() { return itFacialtype; }
    public void setItFacialtype(String itFacialtype) { this.itFacialtype = itFacialtype; }
	public String getItFashion() { return itFashion; }
	public void setItFashion(String itFashion) { this.itFashion = itFashion; }
	public boolean isItSmoke() { return itSmoke; }
	public void setItSmoke(boolean itSmoke) { this.itSmoke = itSmoke; }
	public String isItHobby() { return itHobby; }
	public void setItHobby(String itHobby) { this.itHobby = itHobby; }
	
}