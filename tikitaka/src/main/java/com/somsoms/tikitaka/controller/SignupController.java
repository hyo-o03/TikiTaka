package com.somsoms.tikitaka.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.somsoms.tikitaka.domain.Idealtype;
import com.somsoms.tikitaka.domain.User;
import com.somsoms.tikitaka.repository.IdealtypeRepository;
import com.somsoms.tikitaka.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/signup")
public class SignupController {
	@Autowired
	private UserRepository userRepository;
	    
	@Autowired
	private IdealtypeRepository idealtypeRepository;

	@GetMapping("/start")
	public String showStart() {
		return "start";
	}
	
	@GetMapping("/register")
	public String showRegister() {
		return "register";
	}
	
	@PostMapping("/agree")
	public String showAgree() {
		return "agree";
	}
	
	@PostMapping("/verifyCode")
	public String showVerifyCode() {
		return "verifyCode";
	}
	
	@PostMapping("/terms")
	public String showCertification(@RequestParam String registerPhone,
							        @RequestParam String registerEmail,
							        HttpSession session) {
		session.setAttribute("phone", registerPhone);
		session.setAttribute("email", registerEmail);
		return "terms";
	}
	
	@PostMapping("/baseInfo")
	public String showBaseInfo(@RequestParam(name = "agree4", defaultValue = "N") String alarmAgree,
					            HttpSession session) {
		session.setAttribute("alarmAgree", alarmAgree);
	    
		return "baseInfo";
	}
	
	@PostMapping("/signupSuccess")
	public String showSignupSuccess(@RequestParam String name,
						            @RequestParam int age,
						            @RequestParam String gender,
						            @RequestParam double height,
						            @RequestParam(required = false) Double weight,
						            @RequestParam(name = "weightPrivate", defaultValue = "N") String weightPrivate,
						            @RequestParam int itAge,
						            @RequestParam String agePreference,
						            HttpSession session) {
		
		session.setAttribute("name", name);
		session.setAttribute("gender", gender);
	    session.setAttribute("age", age);
	    session.setAttribute("height", height);
	    session.setAttribute("weight", weight);
	    if (weightPrivate.equals("on")) {
	        weightPrivate = "Y";
		    session.setAttribute("weightPrivate", weightPrivate);
	    }
	    session.setAttribute("itAge", itAge);
	    session.setAttribute("agePreference", agePreference);
	    
	    // User 정보 가져오기
	    String email = (String) session.getAttribute("email");
	    String phone = (String) session.getAttribute("phone");
	    String alarmAgree = (String) session.getAttribute("alarmAgree");

	    // User 생성 및 저장
	    User user = new User();
	    user.setEmail(email);
	    user.setPhone(phone);
	    user.setAlarmAgree(alarmAgree);
	    user.setName(name);
	    user.setGender(gender);
	    user.setAge(age);
	    user.setHeight(height);
	    user.setWeight(weight);
	    user.setWeightPrivate(weightPrivate);

	    userRepository.save(user);

	    // Idealtype 생성 및 저장
	    Idealtype ideal = new Idealtype();
	    ideal.setUser(user);
	    ideal.setItAge(itAge);
	    ideal.setItAgePreference(agePreference);

	    idealtypeRepository.save(ideal);

	    // userId 세션 저장
	    session.setAttribute("userId", user.getUserId());

	    return "signupSuccess";
	}
}
