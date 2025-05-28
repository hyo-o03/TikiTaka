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
@Table(name="IDEALTYPE")
public class Idealtype {

    /* Private Fields */
    
    // db 자동 생성
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ideal_id_seq")
    @SequenceGenerator(name = "ideal_id_seq", sequenceName = "IDEAL_SEQ", allocationSize = 1)
    @Column(name = "IT_ID")
    private int itId;

    @ManyToOne
    @JoinColumn(name = "ID", nullable = false)  // 외래키 → User 테이블
    private User user;

    @Column(name = "IT_AGE")
    private int itAge;

    @Column(name = "IT_HEIGHT")
    private double itHeight;

    @Column(name = "IT_MBTI", length = 5)
    private String itMbti;

    @Column(name = "IT_ADDRESS", length = 10)
    private String itAddress;

    @Column(name = "IT_FACIAL_TYPE", length = 10)
    private String itFacialtype;

    @Column(name = "IT_FASHION", length = 10)
    private String itFashion;

    @Column(name = "IT_SMOKE")
    private boolean itSmoke;

    @Column(name = "IT_HOBBY", length = 10)
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