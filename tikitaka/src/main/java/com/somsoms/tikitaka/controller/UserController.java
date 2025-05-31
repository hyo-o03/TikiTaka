package com.somsoms.tikitaka.controller;

import org.springframework.beans.factory.annotation.Autowired;
import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.repository.IdealtypeRepository;
import com.somsoms.tikitaka.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.http.ResponseEntity;
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
        User user = userService.getUserById(1); // 임시 ID
        model.addAttribute("user", user);
        return "editMyProfile";
    }
    
    // 자기소개 수정
    @GetMapping("/mypage/edit/editIntroduce")
    public String showEditIntroduce() {
        return "editIntroduce";
    }
    
    // 프로필 동물 수정
    @GetMapping("/mypage/edit/editProfile")
    public String showEditProfile() {
        return "editProfile";
    }
    
    //주소 수정
	@GetMapping("/mypage/edit/editAddress")
	public String showAddress() {
		return "editAddress";
	}
	
	//취미 수정
	@GetMapping("/mypage/edit/editHobby")
	public String showHobby() {
		return "editHobby";
	}
	
	// MBTI 수정
    @GetMapping("/mypage/edit/editMbti")
    public String showEditMbti() {
        return "editMbti";
    }

    //sns 수정
	@GetMapping("/mypage/edit/editSns")
	public String showSns() {
		return "editSns";
	}
	
	//스타일 수정
	@GetMapping("/mypage/edit/editStyle")
	public String showStyle() {
		return "editStyle";
	}
	
	//흡연여부 수정
	@GetMapping("/mypage/edit/editSmoke")
	public String showSmoke() {
		return "editSmoke";
	}
	
	// 종교 수정
    @GetMapping("/mypage/edit/editReligion")
    public String showEditReligion() {
        return "editReligion";
    }
	
//	private UserService userService;
	
	@Autowired
	private UserRepository userRepository;
	    
	@Autowired
	private IdealtypeRepository idealtypeRepository;
	
	
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
    
    
    @PostMapping("/updateIntroduce")
    public String updateIntroduce(@RequestParam("introduce") String introduce,
                                  HttpSession session) {
//        int userId = (Integer) session.getAttribute("userId");
    	int userId = 1;
        User user = userRepository.findById(userId).orElseThrow();
        user.setIntroduce(introduce);
        userRepository.save(user);
        
        return "redirect:/user/mypage/edit";    
        }
    @PostMapping("/updateFacialType")
    public String updateFacialType(@RequestParam("facialType") String facialType,
                                   HttpSession session) {
        int userId = 1; //임시
        User user = userRepository.findById(userId).orElseThrow();
        user.setFacialType(facialType);
        userRepository.save(user);
        return "redirect:/user/mypage/edit";
    }
    
    @PostMapping("/updateAddress")
    public String updateAddress(@RequestParam("userRegion") String address,
                                HttpSession session) {
        int userId = 1; //
        User user = userRepository.findById(userId).orElseThrow();
        user.setAddress(address);
        userRepository.save(user);
        return "redirect:/user/mypage/edit";
    }
    @PostMapping("/updateHobby")
    public String updateHobby(@RequestParam("hobby") String hobby,
                              HttpSession session) {
        int userId = 1; //
        User user = userRepository.findById(userId).orElseThrow();
        user.setHobby(hobby); // 쉼표로 구분된 문자열
        userRepository.save(user);
        return "redirect:/user/mypage/edit";
    }
    @PostMapping("/updateMbti")
    public String updateMbti(@RequestParam(value = "mbti", required = false) String mbti,
                             HttpSession session) {
        int userId = 1; // 
        User user = userRepository.findById(userId).orElseThrow();
        if (mbti == null || mbti.isBlank()) {
            user.setMbti(null);
        } else {
            user.setMbti(mbti);
        }
        userRepository.save(user);
        return "redirect:/user/mypage/edit";
    }
    
    @PostMapping("/updateSns")
    public String updateSns(@RequestParam("kakaoId") String kakaoId,
                            @RequestParam(value = "snsId", required = false) String snsId,
                            HttpSession session) {
        int userId = 1; //
        User user = userRepository.findById(userId).orElseThrow();
        
        user.setKakaoId(kakaoId);
        if (snsId == null || snsId.trim().isEmpty()) {
            user.setSnsId(null);
        } else {
            user.setSnsId(snsId.trim());
        }
        userRepository.save(user);
        return "redirect:/user/mypage/edit"; 
    }
    @PostMapping("/updateFashion")
    public String updateFashion(@RequestParam("fashion") String fashion,
                                HttpSession session) {
        int userId = 1; // 
        User user = userRepository.findById(userId).orElseThrow();
        user.setFashion(fashion);
        userRepository.save(user);
        return "redirect:/user/mypage/edit";
    }
    @PostMapping("/updateSmoke")
    public String updateSmoke(@RequestParam("smoke") String smoke,
                              HttpSession session) {
        int userId = 1; // 
        User user = userRepository.findById(userId).orElseThrow();
        user.setSmoke(smoke);
        userRepository.save(user);
        return "redirect:/user/mypage/edit";
    }
    @PostMapping("/updateReligion")
    public String updateReligion(@RequestParam("religion") String religion,
                                 HttpSession session) {
        int userId = 1; // 
        User user = userRepository.findById(userId).orElseThrow();
        user.setReligion(religion);
        userRepository.save(user);
        return "redirect:/user/mypage/edit";
    }
 // 기본정보 수정 페이지 (기존 사용자 정보 로드)
    @GetMapping("/baseInfo")
    public String baseInfoPage(Model model, HttpSession session) {
        // int userId = (Integer) session.getAttribute("userId");
        int userId = 1; // 임시 ID
        User user = userRepository.findById(userId).orElseThrow();
        Idealtype idealtype = idealtypeRepository.findByUser_UserId(userId);
        
        model.addAttribute("user", user);
        model.addAttribute("idealtype", idealtype);
        return "baseInfo";
    }

    // 기본정보 업데이트 처리
    @PostMapping("/updateBaseInfo")
    public String updateBaseInfo(@RequestParam("name") String name,
                                @RequestParam("gender") String gender,
                                @RequestParam("age") int age,
                                @RequestParam("height") double height,
                                @RequestParam(value = "weight", required = false) Double weight,
                                @RequestParam(value = "weightPrivate", required = false) String weightPrivate,
                                @RequestParam("itAge") String itAge,
                                @RequestParam("agePreference") String agePreference,
                                HttpSession session) {
        // int userId = (Integer) session.getAttribute("userId");
        int userId = 1; // 임시 ID
        
        User user = userRepository.findById(userId).orElseThrow();
        Idealtype idealtype = idealtypeRepository.findByUser_UserId(userId);
        
        // 사용자 기본정보 업데이트
        user.setName(name);
        user.setGender(gender);
        user.setAge(age);
        user.setHeight(height);
        user.setWeight(weight);
        user.setWeightPrivate(weightPrivate != null ? "Y" : "N");
        
        // 이상형 정보 업데이트
        if (idealtype != null) {
//            idealtype.setItAge(itAge);
//            idealtype.setAgePreference(agePreference);
        	//이상형 데이터쪽 건드려도 될까요..?
            idealtypeRepository.save(idealtype);
        }
        
        userRepository.save(user);
        
        return "redirect:/user/myPage";
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