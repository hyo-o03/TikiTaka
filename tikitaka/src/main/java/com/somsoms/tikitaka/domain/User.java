package com.somsoms.tikitaka.domain;

import jakarta.persistence.*;


@Entity
@Table(name = "USERINFO")
public class User {
	
	/* Private Fields */
	
	// db 자동 생성
//	private int userId;
//	private String facialType;
//	private int age;
//	private String gender;
//	private double height;
//	private double weight;
//	private String kakaoId;
//	private String email;
//	private String phone;
//	private String hobby;
//	private String address;
//	private String introduce;
//	private String mbti;
//	private String fashion;
//	private boolean smoke;
	 @Id
	 @SequenceGenerator(
			    name = "userinfo_seq_gen",          
			    sequenceName = "USER_SEQ",      
			    allocationSize = 1
			)
	 @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_seq_gen")
			private int userId;

	    @Column(name = "FACIAL_TYPE")
	    private String facialType;

	    private int age;

	    private String gender;

	    private double height;

	    private double weight;

	    @Column(name = "KAKAO_ID")
	    private String kakaoId;

	    private String email;

	    private String phone;

	    private String hobby;

	    private String address;

	    @Lob
	    private String introduce;

	    private String mbti;

	    private String religion;

	    private String fashion;

	    private String smoke;


	    @Column(name = "WEIGHT_PRIVATE")
	    private String weightPrivate;

	    @Column(name = "ALARM_AGREE")
	    private String alarmAgree;

	    @Column(name = "SNS_ID")
	    private String snsId;
	    
	    
	    //패스워드 임시생성
	    @Column(name = "PASSWORD")
	    private String password;

	    public String getPassword() { return password; }
	    public void setPassword(String password) { this.password = password; }

	/* Constructors */
	
	User() {}

	/* JavaBeans Properties */
	
	public int getUserId() { return userId; }
	public void setUserId(int userId) { this.userId = userId; }
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
	public String getReligion() { return religion; }
	public void setReligion(String religion) { this.religion = religion; }
	public String getFashion() { return fashion; }
	public void setFashion(String fashion) { this.fashion = fashion; }
	public String getSmoke() { return smoke; }
	public void setSmoke(String smoke) { this.smoke = smoke; }
	
}