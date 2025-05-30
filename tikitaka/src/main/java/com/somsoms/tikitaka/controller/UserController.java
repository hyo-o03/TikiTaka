package com.somsoms.tikitaka.controller;

import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.repository.IdealtypeRepository;
import com.somsoms.tikitaka.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class UserController {
//	private UserService userService;
	
	@Autowired
	private UserRepository userRepository;
	    
	@Autowired
	private IdealtypeRepository idealtypeRepository;
	
	@GetMapping("/profile")
	public String showProfile() {
		return "profileForm";
	}
	
	@PostMapping("/address")
	public String showAddress(@RequestParam String facialType, HttpSession session) {
	    int userId = (Integer) session.getAttribute("userId");
	    User user = userRepository.findById(userId).orElseThrow();
	    user.setFacialType(facialType);
	    userRepository.save(user);
		return "addressForm";
	}
	
	@PostMapping("/hobby")
	public String showHobby(@RequestParam String address,
					          @RequestParam String itAddressPref,
					          HttpSession session) {
		int userId = (Integer) session.getAttribute("userId");
		User user = userRepository.findById(userId).orElseThrow();
		Idealtype ideal = idealtypeRepository.findByUser_UserId(userId);
		
		user.setAddress(address);
		ideal.setItDistancepref(itAddressPref);
		
		userRepository.save(user);
		idealtypeRepository.save(ideal);
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
    public String showSns(@RequestParam String mbti,
                           HttpSession session, Model model) {
        int userId = (Integer) session.getAttribute("userId");
        User user = userRepository.findById(userId).orElseThrow();
        user.setMbti(mbti);
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
        user.setSnsId(snsId);
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
	
	@PostMapping("/home")
	public String showHome() {
		return "home";
	}
	
	@GetMapping("/home")
	public String showGetHome() {
		return "home";
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