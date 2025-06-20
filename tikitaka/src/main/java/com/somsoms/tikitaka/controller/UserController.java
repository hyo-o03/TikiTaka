package com.somsoms.tikitaka.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.repository.AlarmRepository;
import com.somsoms.tikitaka.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
        User user = userService.getUserById(1066); // 임시 ID
        model.addAttribute("user", user);
        return "editMyProfile";
    }
	
//	private UserService userService;
	
	@Autowired
	private UserRepository userRepository;
	
    @Autowired
    private AlarmRepository alarmRepository;
	
	@PostMapping("/hobby")
	public String showHobby(@RequestParam String facialType, HttpSession session) {
		Object idAttr = session.getAttribute("userId");
		int userId = Integer.parseInt(idAttr.toString());
	    User user = userRepository.findById(userId).orElseThrow();
	    user.setFacialType(facialType);
	    userRepository.save(user);
		return "animalProfileForm";
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

	@PostMapping("/mbti")
    public String showMbti(@RequestParam String hobby,
                            HttpSession session, Model model) {
        int userId = (Integer) session.getAttribute("userId");
        User user = userRepository.findById(userId).orElseThrow();
        user.setHobby(hobby);
        userRepository.save(user);
        return "mbtiForm";
    }
	
    @PostMapping("/sns")
    public String showSns(@RequestParam(value = "mbti", required = false) String mbti,
                           HttpSession session, Model model) {
        int userId = (Integer) session.getAttribute("userId");
        User user = userRepository.findById(userId).orElseThrow();
        
        if (mbti == null || mbti.isBlank()) {
            user.setMbti(null); // 몰라요 → null 저장
        } else {
            user.setMbti(mbti);
        }
        
        userRepository.save(user);
        return "snsForm";
    }

    @PostMapping("/style")
    public String showStyle(@RequestParam String kakaoId,
                          @RequestParam(required = false) String snsId,
                          HttpSession session, Model model) {
        int userId = (Integer) session.getAttribute("userId");
        User user = userRepository.findById(userId).orElseThrow();
        user.setKakaoId(kakaoId);
        
        // ✅ "sns가 없어요" → null 저장
        if (snsId == null || snsId.trim().isEmpty()) {
            user.setSnsId(null);
        } else {
            user.setSnsId(snsId.trim());
        }
        
        userRepository.save(user);
        return "styleForm";
    }

    @PostMapping("/smoke")
    public String showSmoke(@RequestParam String fashion,
                            HttpSession session, Model model) {
        int userId = (Integer) session.getAttribute("userId");
        User user = userRepository.findById(userId).orElseThrow();
        user.setFashion(fashion);
        userRepository.save(user);
        return "smokeForm";
    }

    @PostMapping("/religion")
    public String showReligion(@RequestParam String smoke,
                            HttpSession session, Model model) {
        int userId = (Integer) session.getAttribute("userId");
        User user = userRepository.findById(userId).orElseThrow();
        user.setSmoke(smoke);
        userRepository.save(user);
        return "religionForm";
    }

    @PostMapping("/introduce")
    public String showIntroduce(@RequestParam String religion,
                               HttpSession session, Model model) {
        int userId = (Integer) session.getAttribute("userId");
        User user = userRepository.findById(userId).orElseThrow();
        user.setReligion(religion);
        userRepository.save(user);
        return "introduceForm";
    }

    @PostMapping("/finishSurvey")
    public String showEnd(@RequestParam String introduce,
                                HttpSession session, Model model) {
        int userId = (Integer) session.getAttribute("userId");
        User user = userRepository.findById(userId).orElseThrow();
        user.setIntroduce(introduce);
        userRepository.save(user);
        return "finishSurvey";
    }
	
    
    @PostMapping("/updateIntroduce")
    public String updateIntroduce(@RequestParam("introduce") String introduce,
                                  HttpSession session) {
//        int userId = (Integer) session.getAttribute("userId");
    	int userId = 1;
        User user = userRepository.findById(userId).orElseThrow();
        user.setIntroduce(introduce);
        userRepository.save(user);
        
        return "editIntroduce";    
    }
    
    @PostMapping("/updateFacialType")
    public String updateFacialType(@RequestParam("facialType") String facialType,
                                   HttpSession session) {
        int userId = 1; //임시
        User user = userRepository.findById(userId).orElseThrow();
        user.setFacialType(facialType);
        userRepository.save(user);
        return "editProfile";
    }
    
    @PostMapping("/updateAddress")
    public String updateAddress(@RequestParam("userRegion") String address,
                                HttpSession session) {
        int userId = 1; //
        User user = userRepository.findById(userId).orElseThrow();
        user.setAddress(address);
        userRepository.save(user);
        return "editAddress";
    }
    
    @PostMapping("/updateHobby")
    public String updateHobby(@RequestParam("hobby") String hobby,
                              HttpSession session) {
        int userId = 1; //
        User user = userRepository.findById(userId).orElseThrow();
        user.setHobby(hobby); // 쉼표로 구분된 문자열
        userRepository.save(user);
        return "editHobby";
    }
    
    @PostMapping("/updateMbti")
    public void updateMbti(@RequestParam(value = "mbti", required = false) String mbti,
                             HttpSession session) {
        int userId = 1; // 
        User user = userRepository.findById(userId).orElseThrow();
        if (mbti == null || mbti.isBlank()) {
            user.setMbti(null);
        } else {
            user.setMbti(mbti);
        }
        userRepository.save(user);
      
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
	public String showHome(HttpSession session, Model model) {
		Integer userId = (Integer) session.getAttribute("userId");
	    if (userId == null) {
	        return "redirect:/signup/login"; // 로그인 안 되어있으면 로그인으로
	    }

	    User user = userRepository.findById(userId).orElse(null);
	    model.addAttribute("user", user);
	    
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
		return "home";
	}
	
	@PostMapping("/mypage/edit")
	public String updateMyProfile(User user) {
	    user.setUserId(1066); // 임시로 userId 고정 (세션 처리 전용)
	    userService.updateUser(user);
	    return "redirect:/user/myPage"; // 수정 후 마이페이지로 이동
	}
	
    // 설문 완료
    @GetMapping("/finishSurvey")
    public String showFinishSurvey() {
        return "finishSurvey";
    }
}