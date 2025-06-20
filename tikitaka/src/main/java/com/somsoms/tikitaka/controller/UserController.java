package com.somsoms.tikitaka.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.repository.AlarmRepository;
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
    @PostMapping("/animalProfile")
    public String showProfileForm() {
        return "animalProfileForm";
    }
    
    @GetMapping("/religion")
    public String ProfileForm() {
        return "religionForm";
    }
	
//	private UserService userService;
	
	@Autowired
	private UserRepository userRepository;
	    
	@Autowired
	private IdealtypeRepository idealtypeRepository;
	
    @Autowired
    private AlarmRepository alarmRepository;
	
	@PostMapping("/address")
	public String showAddress(@RequestParam String facialType, HttpSession session) {
		Object idAttr = session.getAttribute("userId");
		int userId = Integer.parseInt(idAttr.toString());
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
        return "editMbti";
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
        return "editSns"; 
    }
    
    @PostMapping("/updateFashion")
    public String updateFashion(@RequestParam("style") String fashion,
                                HttpSession session) {
        int userId = 1; // 
        User user = userRepository.findById(userId).orElseThrow();
        user.setFashion(fashion);
        userRepository.save(user);
        return "editStyle";
    }
    
    @PostMapping("/updateSmoke")
    public String updateSmoke(@RequestParam("smoke") String smoke,
                              HttpSession session) {
        int userId = 1; // 
        User user = userRepository.findById(userId).orElseThrow();
        user.setSmoke(smoke);
        userRepository.save(user);
        return "editSmoke";
    }
    
    @PostMapping("/updateReligion")
    public String updateReligion(@RequestParam("religion") String religion,
                                 HttpSession session) {
        int userId = 1; // 
        User user = userRepository.findById(userId).orElseThrow();
        user.setReligion(religion);
        userRepository.save(user);
        return "editReligion";
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
        
        return "editBaseInfo";
    }
    
	@GetMapping("/home")
	public String showHome(Model model, HttpSession session) {
		
//	    User loginUser = (User) session.getAttribute("loginUser");
//	    if (loginUser == null) {
//	        return "redirect:/login";
//	    }

	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(1067);
	    model.addAttribute("alarmList", alarmList);

		return "home";
	}
	
	@PostMapping("/home")
	public String Home() {
		return "home";
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