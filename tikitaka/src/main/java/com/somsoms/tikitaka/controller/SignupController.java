package com.somsoms.tikitaka.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/signup")
public class SignupController {
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
	public String showCertification() {
		return "terms";
	}
	
	@PostMapping("/baseInfo")
	public String showBaseInfo() {
		return "baseInfo";
	}
	
	@PostMapping("/signupSuccess")
	public String showSignupSuccess() {
		return "signupSuccess";
	}
}
