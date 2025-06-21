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
	private UserRepository userRepository;
	
    @Autowired
    private AlarmRepository alarmRepository;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }
    
    @GetMapping("/myPage")
    public String showMyPage(HttpSession session, Model model) {
		Integer userId = (Integer) session.getAttribute("userId");
	    if (userId == null) {
	        return "redirect:/signup/login"; // 로그인 안 되어있으면 로그인으로
	    }
	    
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
    	
        return "myPage";
    }
    
    // 프로필 정보 폼
    @PostMapping("/animalProfile")
    public String showProfileForm() {
        return "animalProfileForm";
    }
	
	@PostMapping("/hobby")
	public String showHobby(@RequestParam String facialType, HttpSession session) {
		Object idAttr = session.getAttribute("userId");
		int userId = Integer.parseInt(idAttr.toString());
	    User user = userRepository.findById(userId).orElseThrow();
	    user.setFacialType(facialType);
	    userRepository.save(user);
	    
		return "hobbyForm";
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
	
	// ✅ 로그아웃 처리
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 전체 삭제
        return "redirect:/signup/start";  // 첫화면으로 이동
    }

    // ✅ 회원 탈퇴 처리
    @GetMapping("/deleteComplete")
    public String deleteUser(HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId != null) {
            // 회원 탈퇴 처리
            userService.deleteById(userId);
            session.invalidate(); // 세션도 삭제
        }

        return "deleteComplete";  // 탈퇴 완료 페이지로 이동
    }
}