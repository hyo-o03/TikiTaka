package com.somsoms.tikitaka.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.somsoms.tikitaka.domain.User;
import com.somsoms.tikitaka.service.UserService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
    @Autowired
    private UserService userService;
    
    // 임시 사용자 ID (모든 메서드에서 공통 사용)
    private static final int TEMP_USER_ID = 1066;

    @GetMapping("/mypage")
    public String myPage() { return "myPage"; }
    
    @PostMapping("/mypage")
    public String postMyPage() { return "myPage"; }
    
    @GetMapping("/editPassword")
    public String editPassword() { return "editPassword"; }
    
    @PostMapping("/updatePassword")
    public String updatePassword(@RequestParam String currentPassword, 
                               @RequestParam String newPassword,
                               Model model) {
        boolean success = userService.updatePassword(TEMP_USER_ID, currentPassword, newPassword);
        
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
    public String editBaseInfo(Model model) { 
        User user = userService.getUserById(TEMP_USER_ID);
        model.addAttribute("user", user);
        return "editBaseInfo"; 
    }
    
    @PostMapping("/updateBaseInfo")
    public String updateBaseInfo(@RequestParam String name, 
                               @RequestParam String age,        
                               @RequestParam String gender,
                               @RequestParam String height,       
                               @RequestParam String weight,     
                               @RequestParam String address,
                               @RequestParam(required = false) String weightPrivate) {
        User user = userService.getUserById(TEMP_USER_ID);
        user.setName(name);
        user.setAge(Integer.parseInt(age));                   
        user.setGender(gender);
        user.setHeight(Integer.parseInt(height.split("\\.")[0])); // 소수점 제거 후 int 변환
        user.setWeight(Integer.parseInt(weight.split("\\.")[0])); // 소수점 제거 후 int 변환
        user.setAddress(address);
        user.setWeightPrivate(weightPrivate != null ? "Y" : "N");
        userService.updateUser(user);
        return "redirect:/mypage/mypage";
    }
    
    @GetMapping("/editFormMenu")
    public String editFormMenu() { return "editFormMenu"; }
    
    @PostMapping("/editFormMenu")
    public String postEditFormMenu() { return "editFormMenu"; }
    
    @GetMapping("/checkIdealForm")
    public String checkIdealForm() { return "checkIdealForm"; }
    
    @GetMapping("/idealTypeForm")
    public String idealTypeForm() { return "idealTypeForm"; }
    
    @GetMapping("/friendTypeForm")
    public String friendTypeForm() { return "friendTypeForm"; }
    
    @GetMapping("/editAnimalProfile")
    public String editAnimalProfile(Model model) { 
        User user = userService.getUserById(TEMP_USER_ID);
        model.addAttribute("user", user);
        return "editAnimalProfile"; 
    }
    
    @PostMapping("/updateFacialType")
    public String updateFacialType(@RequestParam String facialType) {
        User user = userService.getUserById(TEMP_USER_ID);
        user.setFacialType(facialType);
        userService.updateUser(user);
        return "redirect:/mypage/editFormMenu";
    }
    
    @GetMapping("/editAddress")
    public String editAddress(Model model) { 
        User user = userService.getUserById(TEMP_USER_ID);
        model.addAttribute("user", user);
        return "editAddress"; 
    }
    
    @PostMapping("/updateAddress")
    public String updateAddress(@RequestParam String address) {
        User user = userService.getUserById(TEMP_USER_ID);
        user.setAddress(address);
        userService.updateUser(user);
        return "redirect:/mypage/editFormMenu";
    }
    
    @GetMapping("/editHobby")
    public String editHobby(Model model) { 
        User user = userService.getUserById(TEMP_USER_ID);
        model.addAttribute("user", user);
        return "editHobby"; 
    }
    @PostMapping("/updateHobby")
    public String updateHobby(@RequestParam(value = "hobby", required = false) String[] hobbies) {
        User user = userService.getUserById(TEMP_USER_ID);
        if (hobbies != null && hobbies.length > 0) {
            String hobbyString = String.join(",", hobbies);
            user.setHobby(hobbyString);
        } else {
            user.setHobby("");
        }
        userService.updateUser(user);
        return "redirect:/mypage/editFormMenu";
    }
    
    @GetMapping("/editMbti")
    public String editMbti(Model model) { 
        User user = userService.getUserById(TEMP_USER_ID);
        model.addAttribute("user", user);
        return "editMbti"; 
    }
    
    @PostMapping("/updateMbti")
    public String updateMbti(@RequestParam String mbti) {
        User user = userService.getUserById(TEMP_USER_ID);
        user.setMbti(mbti);
        userService.updateUser(user);
        return "redirect:/mypage/editFormMenu";
    }
    
    @GetMapping("/editSns")
    public String editSns(Model model) { 
        User user = userService.getUserById(TEMP_USER_ID);
        model.addAttribute("user", user);
        return "editSns"; 
    }
    
    @PostMapping("/updateSns")
    public String updateSns(@RequestParam String sns) {
        User user = userService.getUserById(TEMP_USER_ID);
        user.setSnsId(sns);
        userService.updateUser(user);
        return "redirect:/mypage/editFormMenu";
    }
    
    @GetMapping("/editStyle")
    public String editStyle(Model model) { 
        User user = userService.getUserById(TEMP_USER_ID);
        model.addAttribute("user", user);
        return "editStyle"; 
    }
    
    @PostMapping("/updateStyle")
    public String updateStyle(@RequestParam String style) {
        User user = userService.getUserById(TEMP_USER_ID);
        user.setFashion(style);
        userService.updateUser(user);
        return "redirect:/mypage/editFormMenu";
    }
    
    @GetMapping("/editReligion")
    public String editReligion(Model model) { 
        User user = userService.getUserById(TEMP_USER_ID);
        model.addAttribute("user", user);
        return "editReligion"; 
    }
    @PostMapping("/updateReligion")
    public String updateReligion(@RequestParam String religion) {
        User user = userService.getUserById(TEMP_USER_ID);
        user.setReligion(religion);
        userService.updateUser(user);
        return "redirect:/mypage/editFormMenu";
    }

    
    @GetMapping("/editSmoke")
    public String editSmoke(Model model) { 
        User user = userService.getUserById(TEMP_USER_ID);
        model.addAttribute("user", user);
        return "editSmoke"; 
    }
    @PostMapping("/updateSmoke")
    public String updateSmoke(@RequestParam String smoke) {
        User user = userService.getUserById(TEMP_USER_ID);
        user.setSmoke(smoke);
        userService.updateUser(user);
        return "redirect:/mypage/editFormMenu";
    }
    
    
    @GetMapping("/editIntroduce")
    public String editIntroduce(Model model) { 
        User user = userService.getUserById(TEMP_USER_ID);
        model.addAttribute("user", user);
        return "editIntroduce"; 
    }
    @PostMapping("/updateIntroduce")
    public String updateIntroduce(@RequestParam String introduce) {
        User user = userService.getUserById(TEMP_USER_ID);
        user.setIntroduce(introduce);
        userService.updateUser(user);
        return "redirect:/mypage/editFormMenu";
    }
}