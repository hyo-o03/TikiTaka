package com.somsoms.tikitaka.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.somsoms.tikitaka.domain.Alarm;
import com.somsoms.tikitaka.domain.User;
import com.somsoms.tikitaka.repository.AlarmRepository;
import com.somsoms.tikitaka.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
    @Autowired
    private UserService userService;
    
    @Autowired
    private AlarmRepository alarmRepository;

    @GetMapping("/mypage")
    public String myPage() { return "myPage"; }
    
    @PostMapping("/mypage")
    public String postMyPage() { return "myPage"; }
    
    @GetMapping("/editPassword")
    public String editPassword(HttpSession session, Model model) { 
		Integer userId = (Integer) session.getAttribute("userId");
	    if (userId == null) {
	        return "redirect:/signup/login"; // 로그인 안 되어있으면 로그인으로
	    }
	    
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
    	
    	return "editPassword"; 
    }
    
    @PostMapping("/updatePassword")
    public String updatePassword(@RequestParam String currentPassword, 
                               @RequestParam String newPassword,
                               HttpSession session,
                               Model model) {
    	int userId = (int) session.getAttribute("userId");
    	boolean success = userService.updatePassword(userId, currentPassword, newPassword);
    	
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
        
        if (success) {
            return "redirect:/mypage/mypage";
        } else {
            model.addAttribute("errorMessage", "현재 비밀번호가 일치하지 않습니다.");
            return "editPassword";
        }
    }
    
    @GetMapping("/editFacePic")
    public String editFacePic() { return "editFacePic"; }
    
    @GetMapping("/editBaseInfo")
    public String editBaseInfo(HttpSession session,
    							Model model) {
		int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        model.addAttribute("user", user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "editBaseInfo"; 
    }
    
    @PostMapping("/updateBaseInfo")
    public String updateBaseInfo(@RequestParam String name, 
                               @RequestParam String age,        
                               @RequestParam String gender,
                               @RequestParam String height,       
                               @RequestParam String weight,     
                               @RequestParam String address,
                               @RequestParam(required = false) String weightPrivate,
                               HttpSession session,
                               Model model) {
    	int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        user.setName(name);
        user.setAge(Integer.parseInt(age));                   
        user.setGender(gender);
        user.setHeight(Integer.parseInt(height.split("\\.")[0])); // 소수점 제거 후 int 변환
        user.setWeight(Integer.parseInt(weight.split("\\.")[0])); // 소수점 제거 후 int 변환
        user.setAddress(address);
        user.setWeightPrivate(weightPrivate != null ? "Y" : "N");
        userService.updateUser(user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "redirect:/mypage/mypage";
    }
    
    @GetMapping("/editFormMenu")
    public String editFormMenu(HttpSession session, Model model) { 
		Integer userId = (Integer) session.getAttribute("userId");
	    if (userId == null) {
	        return "redirect:/signup/login"; // 로그인 안 되어있으면 로그인으로
	    }
	    
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
    	return "editFormMenu"; 
    }
    
    @PostMapping("/editFormMenu")
    public String postEditFormMenu(HttpSession session, Model model) { 
		Integer userId = (Integer) session.getAttribute("userId");
	    if (userId == null) {
	        return "redirect:/signup/login"; // 로그인 안 되어있으면 로그인으로
	    }
	    
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
    	return "editFormMenu"; 
    }
    
    @GetMapping("/checkIdealForm")
    public String checkIdealForm() { return "checkIdealForm"; }
    
    @GetMapping("/idealTypeForm")
    public String idealTypeForm() { return "idealTypeForm"; }
    
    @GetMapping("/friendTypeForm")
    public String friendTypeForm() { return "friendTypeForm"; }
    
    @GetMapping("/editAnimalProfile")
    public String editAnimalProfile(HttpSession session,
    								Model model) {
		int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        model.addAttribute("user", user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "editAnimalProfile"; 
    }
    
    @PostMapping("/updateFacialType")
    public String updateFacialType(@RequestParam String facialType,
    								HttpSession session,
						            Model model) {
		int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        user.setFacialType(facialType);
        userService.updateUser(user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "redirect:/mypage/editFormMenu";
    }
    
    @GetMapping("/editAddress")
    public String editAddress(HttpSession session,
    						Model model) {
    	int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        model.addAttribute("user", user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "editAddress"; 
    }
    
    @PostMapping("/updateAddress")
    public String updateAddress(@RequestParam String address,
					    		HttpSession session,
					            Model model) {
    	int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        user.setAddress(address);
        userService.updateUser(user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "redirect:/mypage/editFormMenu";
    }
    
    @GetMapping("/editHobby")
    public String editHobby(HttpSession session,
    						Model model) {
    	int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        model.addAttribute("user", user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "editHobby"; 
    }
    
    @PostMapping("/updateHobby")
    public String updateHobby(@RequestParam(value = "hobby", required = false) String[] hobbies,
					    		HttpSession session,
					            Model model) {
    	int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        if (hobbies != null && hobbies.length > 0) {
            String hobbyString = String.join(",", hobbies);
            user.setHobby(hobbyString);
        } else {
            user.setHobby("");
        }
        userService.updateUser(user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "redirect:/mypage/editFormMenu";
    }
    
    @GetMapping("/editMbti")
    public String editMbti(HttpSession session,
    						Model model) {
    	int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        model.addAttribute("user", user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "editMbti"; 
    }
    
    @PostMapping("/updateMbti")
    public String updateMbti(@RequestParam String mbti,
    						HttpSession session,
    						Model model) {
	int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        user.setMbti(mbti);
        userService.updateUser(user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "redirect:/mypage/editFormMenu";
    }
    
    @GetMapping("/editSns")
    public String editSns(HttpSession session,
    						Model model) {
    	int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        model.addAttribute("user", user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "editSns"; 
    }
    
    @PostMapping("/updateSns")
    public String updateSns(@RequestParam(value = "snsId", required = false) String snsId,
                            @RequestParam("kakaoId") String kakaoId,
                            HttpSession session,
                            Model model) {
    	int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        user.setSnsId(snsId);
        user.setKakaoId(kakaoId);
        userService.updateUser(user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "redirect:/mypage/editFormMenu";
    }
    
    @GetMapping("/editStyle")
    public String editStyle(HttpSession session,
    						Model model) {
    	int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        model.addAttribute("user", user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "editStyle"; 
    }
    
    @PostMapping("/updateStyle")
    public String updateStyle(@RequestParam String style,
    						HttpSession session,
    						Model model) {
    	int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        user.setFashion(style);
        userService.updateUser(user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "redirect:/mypage/editFormMenu";
    }
    
    @GetMapping("/editReligion")
    public String editReligion(HttpSession session,
    							Model model) {
    	int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        model.addAttribute("user", user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "editReligion"; 
    }
    
    @PostMapping("/updateReligion")
    public String updateReligion(@RequestParam String religion,
    							HttpSession session,
    							Model model) {
    	int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        user.setReligion(religion);
        userService.updateUser(user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "redirect:/mypage/editFormMenu";
    }
    
    @GetMapping("/editSmoke")
    public String editSmoke(HttpSession session,
    						Model model) {
    	int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        model.addAttribute("user", user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "editSmoke"; 
    }
    
    @PostMapping("/updateSmoke")
    public String updateSmoke(@RequestParam String smoke,
    						HttpSession session,
    						Model model) {
    	int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        user.setSmoke(smoke);
        userService.updateUser(user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "redirect:/mypage/editFormMenu";
    }
    
    
    @GetMapping("/editIntroduce")
    public String editIntroduce(HttpSession session,
    						Model model) {
    	int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        model.addAttribute("user", user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "editIntroduce"; 
    }
    @PostMapping("/updateIntroduce")
    public String updateIntroduce(@RequestParam String introduce,
    							HttpSession session,
    							Model model) {
    	int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        user.setIntroduce(introduce);
        userService.updateUser(user);
        
	    List<Alarm> alarmList = alarmRepository.findByReceiver_UserId(userId);
	    model.addAttribute("alarmList", alarmList);
	    
        return "redirect:/mypage/editFormMenu";
    }
}