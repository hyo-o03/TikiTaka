package com.somsoms.tikitaka.controller;

import com.somsoms.tikitaka.domain.*;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
//	private UserService userService;
	
	@GetMapping("/profile")
	public String showProfile() {
		return "profileForm";
	}
	
	@PostMapping("/address")
	public String showAddress() {
		return "addressForm";
	}
	
	@PostMapping("/hobby")
	public String showHobby() {
		return "hobbyForm";
	}
	
	@PostMapping("/mbti")
	public String showMbti() {
		return "mbtiForm";
	}

	@PostMapping("/sns")
	public String showSns() {
		return "snsForm";
	}
	
	@PostMapping("/style")
	public String showStyle() {
		return "styleForm";
	}
	
	@PostMapping("/smoke")
	public String showSmoke() {
		return "smokeForm";
	}
	
	@PostMapping("/religion")
	public String showReligion() {
		return "religionForm";
	}
	
	@PostMapping("/introduce")
	public String showIntroduce() {
		return "introduceForm";
	}
	
	@PostMapping("/home")
	public String showHome() {
		return "home";
	}
	
	@GetMapping("/home")
	public String showGetHome() {
		return "home";
	}
	
	@PostMapping("/finishSurvey")
	public String showEnd() {
		return "finishSurvey";
	}
	
	@GetMapping("/myPage")
	public String showMypage() {
		return "myPage";
	}

//    public ResponseEntity<String> registerUser(@RequestBody UserCommand userCommand);
//    
//    public ResponseEntity<String> loginUser(@RequestParam String email, @RequestParam String password);
//    
//    public ResponseEntity<User> getUserInfo(@PathVariable Long userId);
//    
//    public ResponseEntity<String> updateUser(@RequestBody UserCommand userCommand);
//    
//    public ResponseEntity<String> deleteUser(@PathVariable Long userId);

}