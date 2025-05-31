package com.somsoms.tikitaka.dto;

public class UserCommand {

    // ✅ 1단계: 회원가입 단계 (sign/)
    private String registerPhone;
    private String registerEmail;
    private String alarmAgree;

    private String name;
    private int age;
    private String gender;
    private double height;
    private Double weight;
    private String weightPrivate;

    private int itAge;
    private String agePreference;

    // ✅ 2단계: 설문조사 단계 (user/)
    private String facialType;
    private String address;
    private String itAddressPref;
    private String hobby;
    private String mbti;
    private String kakaoId;
    private String snsId;
    private String fashion;
    private String smoke;
    private String religion;
    private String introduce;

    // ⛳ 기본 생성자
    public UserCommand() {}

    // 💡 Getter / Setter 전부 포함
    public String getRegisterPhone() { return registerPhone; }
    public void setRegisterPhone(String registerPhone) { this.registerPhone = registerPhone; }

    public String getRegisterEmail() { return registerEmail; }
    public void setRegisterEmail(String registerEmail) { this.registerEmail = registerEmail; }

    public String getAlarmAgree() { return alarmAgree; }
    public void setAlarmAgree(String alarmAgree) { this.alarmAgree = alarmAgree; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public double getHeight() { return height; }
    public void setHeight(double height) { this.height = height; }

    public Double getWeight() { return weight; }
    public void setWeight(Double weight) { this.weight = weight; }

    public String getWeightPrivate() { return weightPrivate; }
    public void setWeightPrivate(String weightPrivate) { this.weightPrivate = weightPrivate; }

    public int getItAge() { return itAge; }
    public void setItAge(int itAge) { this.itAge = itAge; }

    public String getAgePreference() { return agePreference; }
    public void setAgePreference(String agePreference) { this.agePreference = agePreference; }

    public String getFacialType() { return facialType; }
    public void setFacialType(String facialType) { this.facialType = facialType; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getItAddressPref() { return itAddressPref; }
    public void setItAddressPref(String itAddressPref) { this.itAddressPref = itAddressPref; }

    public String getHobby() { return hobby; }
    public void setHobby(String hobby) { this.hobby = hobby; }

    public String getMbti() { return mbti; }
    public void setMbti(String mbti) { this.mbti = mbti; }

    public String getKakaoId() { return kakaoId; }
    public void setKakaoId(String kakaoId) { this.kakaoId = kakaoId; }

    public String getSnsId() { return snsId; }
    public void setSnsId(String snsId) { this.snsId = snsId; }

    public String getFashion() { return fashion; }
    public void setFashion(String fashion) { this.fashion = fashion; }

    public String getSmoke() { return smoke; }
    public void setSmoke(String smoke) { this.smoke = smoke; }

    public String getReligion() { return religion; }
    public void setReligion(String religion) { this.religion = religion; }

    public String getIntroduce() { return introduce; }
    public void setIntroduce(String introduce) { this.introduce = introduce; }
    
}
