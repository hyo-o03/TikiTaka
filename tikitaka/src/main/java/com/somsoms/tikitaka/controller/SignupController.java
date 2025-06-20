package com.somsoms.tikitaka.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.somsoms.tikitaka.domain.Friendtype;
import com.somsoms.tikitaka.domain.Idealtype;
import com.somsoms.tikitaka.domain.User;
import com.somsoms.tikitaka.repository.FriendtypeRepository;
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
	@Autowired
	private FriendtypeRepository friendtypeRepository;

	@GetMapping("/start")
	public String showStart(HttpSession session) {
		session.invalidate(); // 세션 전체 초기화
		return "start";
	}
	
	@GetMapping("/register")
	public String showRegister(HttpSession session) {
		session.removeAttribute("email");
		session.removeAttribute("phone");
		return "register";
	}
	
	@GetMapping("/login")
	public String login(HttpSession session) {
		session.removeAttribute("email");
		session.removeAttribute("phone");
		return "login";
	}
	
	@PostMapping("/loginCheck")
	public String loginCheck(@RequestParam String emailOrPhone,
	                         @RequestParam String password,  // 비밀번호 사용 시
	                         HttpSession session,
	                         Model model) {

	    User user = userRepository.findByEmail(emailOrPhone);
	    if (user == null) {
	        user = userRepository.findByPhone(emailOrPhone);
	    }

	    System.out.println(">> 사용자 존재 여부: " + (user != null));
	    if (user != null) {
	        System.out.println(">> DB 비밀번호: '" + user.getPassword() + "'");
	        System.out.println(">> 입력 비밀번호: '" + password + "'");
	        System.out.println(">> db 사용자: '" + user.getUserId() + "'");
	        System.out.println(">> 일치 여부: " + user.getPassword().equals(password));
	    }
	    
	    // ① 유저가 없거나
	    // ② 비밀번호가 DB에 없거나
	    // ③ 입력한 비밀번호와 다르면 실패 처리
	    if (user == null || password == "" || !user.getPassword().equals(password)) {
	        model.addAttribute("notFound", true);
	        return "login";
	    }

	    session.setAttribute("userId", user.getUserId());
	    return "redirect:/user/home";
	}

	
	@GetMapping("/checkLogin")
	public String checkLogin() {
		return "checkLogin";
	}
	
	@PostMapping("/agree")
	public String showAgree() {
		return "agree";
	}
	
	@PostMapping("/terms")
	public String showCertification(@RequestParam String registeremailOrPhone,
            @RequestParam(required = false) String registerPassword,
							        HttpSession session, Model model) {
		
		// 1. 이메일/전화번호 & 비밀번호 모두 비어있으면
	    if ((registeremailOrPhone == null || registeremailOrPhone.isBlank()) &&
	        (registerPassword == null || registerPassword.isBlank())) {
	        model.addAttribute("noEmailOrPhone", true);
	        return "register";
	    }

	    // 2. 이메일/전화번호가 입력됐고 이미 존재하는 경우
	    boolean isDuplicate = false;
	    if (registeremailOrPhone != null && !registeremailOrPhone.isBlank()) {
	        if (registeremailOrPhone.contains("@")) {
	            if (userRepository.existsByEmail(registeremailOrPhone)) {
	                isDuplicate = true;
	            } else {
	                session.setAttribute("email", registeremailOrPhone);
	            }
	        } else {
	            if (userRepository.existsByPhone(registeremailOrPhone)) {
	                isDuplicate = true;
	            } else {
	                session.setAttribute("phone", registeremailOrPhone);
	            }
	        }
	    }

	    if (isDuplicate) {
	        model.addAttribute("duplicate", true);
	        return "register";
	    }
	    
	    // 3. 새 이메일/번호지만 비밀번호 없음
	    if (registerPassword == null || registerPassword.isBlank()) {
	        model.addAttribute("noPassword", true);
	        return "register";
	    }

		session.setAttribute("password", registerPassword);
		return "terms";
	}
	
	@PostMapping("/verifyCode")
	public String showVerifyCode(@RequestParam(name = "agree4", defaultValue = "N") String alarmAgree,
		            			HttpSession session) {
		session.setAttribute("alarmAgree", alarmAgree);
		System.out.println("alarmAgree = " + alarmAgree);
		return "verifyCode";
	}
	
	@PostMapping("/baseInfo")
	public String showBaseInfo() {
		return "baseInfo";
	}
	
	@PostMapping("/signupSuccess")
	public String showSignupSuccess(@RequestParam String name,
						            @RequestParam int age,
						            @RequestParam String gender,
						            @RequestParam double height,
						            @RequestParam(required = false) Double weight,
						            @RequestParam(name = "weightPrivate", defaultValue = "N") String weightPrivate,
						            @RequestParam String address,
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
	    session.setAttribute("address", address);
	    
	    // User 정보 가져오기
	    String email = (String) session.getAttribute("email");
	    String phone = (String) session.getAttribute("phone");
	    String alarmAgree = (String) session.getAttribute("alarmAgree");
	    String password = (String) session.getAttribute("password"); // 🔹 추가
	    
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
	    user.setPassword(password); // ✅ 여기 추가
	    user.setAddress(address);
	    
	    userRepository.save(user);
	    
	    // 필수 정보이므로 회원가입과 동시에 기본 정보 insert
	    Idealtype ideal = new Idealtype();
	    ideal.setUser(user);
	    idealtypeRepository.save(ideal);
	    
	    Friendtype friend = new Friendtype();
	    friend.setUser(user);
	    friendtypeRepository.save(friend);
	    
	    // userId 세션 저장
	    session.setAttribute("userId", user.getUserId());

	    return "signupSuccess";
	}
}
