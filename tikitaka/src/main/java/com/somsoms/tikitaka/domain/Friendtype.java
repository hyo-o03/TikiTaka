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
    private Integer ftAge;

    @Column(name = "FT_MBTI", length = 5)
    private String ftMbti;

    @Column(name = "FT_HOBBY", length = 10)
    private String ftHobby;

    @Column(name = "FT_SMOKE")
    private String ftSmoke;
    
    @Column(name = "FT_DISTANCE_PREF", length = 10)
    private String ftDistancePref; // ✅ 새로 추가됨
    
    @Column(name = "FT_AGE_PREFERENCE", length = 10)
    private String ftAgePreference; // ✅ 새로 추가됨

    /* Constructors */
    
    public Friendtype() {}

    /* JavaBeans Properties */
    
    public int getFtId() { return ftId; }
    public void setFtId(int ftId) { this.ftId = ftId; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
    public Integer getFtAge() { return ftAge; }
    public void setFtAge(Integer ftAge) { this.ftAge = ftAge; }
    public String getFtMbti() { return ftMbti; }
    public void setFtMbti(String ftMbti) { this.ftMbti = ftMbti; }
    public String getFtHobby() { return ftHobby; }
    public void setFtHobby(String ftHobby) { this.ftHobby = ftHobby; }
    public String getFtSmoke() { return ftSmoke; }
    public void setFtSmoke(String ftSmoke) { this.ftSmoke = ftSmoke; }
    public String getFtAgePreference() { return ftAgePreference; } // ✅ 추가
    public void setFtAgePreference(String ftAgePreference) { this.ftAgePreference = ftAgePreference; }
    public String getFtDistancePref() { return ftDistancePref; } // ✅ 추가
    public void setFtDistancePref(String ftDistancePref) { this.ftDistancePref = ftDistancePref; }

    
}