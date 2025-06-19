package com.somsoms.tikitaka.domain;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table(name = "USERINFO")
public class User {

    @Id
    @SequenceGenerator(
        name = "userinfo_seq_gen",
        sequenceName = "USER_SEQ",
        allocationSize = 1
    )
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "userinfo_seq_gen")
    @Column(name = "ID")
    private int userId;

    @Column(name = "FACIAL_TYPE", length = 10) // ⛳ 설문에서 입력 → nullable 허용
    private String facialType;

    @Column(name = "AGE", nullable = false)
    private int age;

    @Column(name = "GENDER", length = 2) // ⛳ 설문에서 입력 → nullable 허용
    private String gender;

    @Column(name = "HEIGHT", nullable = false)
    private double height;

    @Column(name = "WEIGHT")
    private Double weight;

    @Column(name = "KAKAO_ID", length = 20) // ⛳ 설문에서 입력 → nullable 허용
    private String kakaoId;

    @Column(name = "EMAIL", nullable = false, length = 20)
    private String email;

    @Column(name = "PHONE", length = 11)
    private String phone;

    @Column(name = "HOBBY", length = 10) // ⛳ 설문에서 입력 → nullable 허용
    private String hobby;

    @Column(name = "ADDRESS", length = 10) // ⛳ 설문에서 입력 → nullable 허용
    private String address;

    @Column(name = "INTRODUCE", columnDefinition = "CLOB")
    private String introduce;

    @Column(name = "MBTI", length = 5) // ⛳ 설문에서 입력 → nullable 허용
    private String mbti;

    @Column(name = "RELIGION", length = 10)
    private String religion;

    @Column(name = "FASHION", length = 10)
    private String fashion;

    @Column(name = "SMOKE")
    private String smoke;

    @Column(name = "PASSWORD")
    private String password;

	 /* ========== 추가된 컬럼들 ========== */
    @Column(name = "NAME", length = 20) // ✅ 새로 추가된 컬럼
    private String name;

    @Column(name = "WEIGHT_PRIVATE", length = 1) // ✅ 새로 추가된 컬럼 ('Y'/'N')
    private String weightPrivate;

    @Column(name = "ALARM_AGREE", length = 1) // ✅ 새로 추가된 컬럼 ('Y'/'N')
    private String alarmAgree;

    @Column(name = "SNS_ID", length = 50) // ✅ 새로 추가된 컬럼 (기타 SNS)
    private String snsId;
    
    /* ========== 이상형 관계 추가 ========== */
    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
    private Idealtype idealtype;
	
	/* Constructors */
	
	public User() {}
	
    public User(String address, int age, String introduce, int userId) {
        this.address = address;
        this.age = age;
        this.introduce = introduce;
        this.userId = userId;
    }
    
	/* Getter/Setter */
	
	public int getUserId() { return userId; }
	public void setUserId(int userId) { this.userId = userId; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
	public String getFacialType() { return facialType; }
	public void setFacialType(String facialType) { this.facialType = facialType; }
	public int getAge() { return age; }
	public void setAge(int age) { this.age = age; }
	public String getGender() { return gender; }
	public void setGender(String gender) { this.gender = gender; }
	public double getHeight() { return height; }
	public void setHeight(double height) { this.height = height; }
	public double getWeight() { return weight; }
	public void setWeight(double weight) { this.weight = weight; }
	public String getKakaoId() { return kakaoId; }
	public void setKakaoId(String kakaoId) { this.kakaoId = kakaoId; }
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
	public String getPhone() { return phone; }
	public void setPhone(String phone) { this.phone = phone; }
	public String getHobby() { return hobby; }
	public void setHobby(String hobby) { this.hobby = hobby; }
	public String getAddress() { return address; }
	public void setAddress(String address) { this.address = address; }
	public String getIntroduce() { return introduce; }
	public void setIntroduce(String introduce) { this.introduce = introduce; }
	public String getMbti() { return mbti; }
	public void setMbti(String mbti) { this.mbti = mbti; }
	public String getFashion() { return fashion; }
	public void setFashion(String fashion) { this.fashion = fashion; }
	public String getReligion() { return religion; }
	public void setReligion(String religion) { this.religion = religion; }
	public String isSmoke() { return smoke; }
	public void setSmoke(String smoke) { this.smoke = smoke; }
	public Idealtype getIdealtype() { return idealtype; }
    public void setIdealtype(Idealtype idealtype) { this.idealtype = idealtype; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getWeightPrivate() { return weightPrivate; }
    public void setWeightPrivate(String weightPrivate) { this.weightPrivate = weightPrivate; }
    public String getAlarmAgree() { return alarmAgree; }
    public void setAlarmAgree(String alarmAgree) { this.alarmAgree = alarmAgree; }
    public String getSnsId() { return snsId; }
    public void setSnsId(String snsId) { this.snsId = snsId; }

	
}