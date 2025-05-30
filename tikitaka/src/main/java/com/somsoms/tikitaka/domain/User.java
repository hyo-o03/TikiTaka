package com.somsoms.tikitaka.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table(name="USERINFO")
public class User {
	
	/* Private Fields */
	
	// db 자동 생성
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_id_seq")
	@SequenceGenerator(name = "user_id_seq", sequenceName = "USER_SEQ", allocationSize = 1)
	@Column(name = "ID") // Oracle에서는 기본 키가 ID로 되어 있음
	private int userId;

	@Column(name = "FACIAL_TYPE", nullable = false, length = 10)
	private String facialType;

	@Column(name = "AGE", nullable = false)
	private int age;

	@Column(name = "GENDER", nullable = false, length = 2)
	private String gender;

	@Column(name = "HEIGHT", nullable = false)
	private double height;

	@Column(name = "WEIGHT")
	private Double weight;

	@Column(name = "KAKAO_ID", nullable = false, length = 20)
	private String kakaoId;

	@Column(name = "EMAIL", nullable = false, length = 20)
	private String email;

	@Column(name = "PHONE", nullable = false, length = 11)
	private String phone;

	@Column(name = "HOBBY", nullable = false, length = 10)
	private String hobby;

	@Column(name = "ADDRESS", nullable = false, length = 10)
	private String address;

	@Column(name = "INTRODUCE")
	private String introduce;

	@Column(name = "MBTI", nullable = false, length = 5)
	private String mbti;

	@Column(name = "RELIGION", length = 10)
	private String religion;

	@Column(name = "FASHION", length = 10)
	private String fashion;

	@Column(name = "SMOKE")
	private String smoke; // CHAR(1) → boolean이 아니라 String으로 매핑
	
	/* Constructors */
	
	User() {}

	/* JavaBeans Properties */
	
	public User(String address, int age, String introduce, int userId) {
        this.address = address;
        this.age = age;
        this.introduce = introduce;
        this.userId = userId;
    }

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
	public String getFashion() { return fashion; }
	public void setFashion(String fashion) { this.fashion = fashion; }
	public String getReligion() { return religion; }
	public void setReligion(String religion) { this.religion = religion; }
	public String isSmoke() { return smoke; }
	public void setSmoke(String smoke) { this.smoke = smoke; }
	
}