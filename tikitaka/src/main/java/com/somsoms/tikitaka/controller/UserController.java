package com.somsoms.tikitaka.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.somsoms.tikitaka.domain.User;
import com.somsoms.tikitaka.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }
 // 마이페이지 홈
    @GetMapping("/myPage")
    public String showMyPage() {
        return "myPage";
    }
    // 프로필 정보 폼
    @GetMapping("/profile")
    public String showProfileForm() {
        return "profileForm";
    }
 // 마이페이지 정보 수정 (editMyProfile.jsp)
    @GetMapping("/mypage/edit")
    public String showEditMyProfile(Model model) {
        User user = userService.getUserById(1); // 임시 ID
        model.addAttribute("user", user);
        return "editMyProfile";
    }
 // 자기소개 수정
    @GetMapping("/editIntroduce")
    public String showEditIntroduce() {
        return "editIntroduce";
    }
 // 프로필 동물 수정
    @GetMapping("/editProfile")
    public String showEditProfile() {
        return "editProfile";
    }
	@GetMapping("/address")
	public String showAddress() {
		return "addressForm";
	}
	
	@GetMapping("/hobby")
	public String showHobby() {
		return "hobbyForm";
	}
	
	// MBTI 수정
    @GetMapping("/editMbti")
    public String showEditMbti() {
        return "editMbti";
    }


	@GetMapping("/sns")
	public String showSns() {
		return "snsForm";
	}
	
	@GetMapping("/style")
	public String showStyle() {
		return "styleForm";
	}
	
	@GetMapping("/smoke")
	public String showSmoke() {
		return "smokeForm";
	}
	
	// 종교 수정
    @GetMapping("/editReligion")
    public String showEditReligion() {
        return "editReligion";
    }
	
	
	@GetMapping("/home")
	public String showHome() {
		return "home";
	}
	
	
    // 설문 완료
    @GetMapping("/finishSurvey")
    public String showFinishSurvey() {
        return "finishSurvey";
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