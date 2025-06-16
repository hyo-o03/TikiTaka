package com.somsoms.tikitaka.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
    @GetMapping("/mypage")
    public String myPage() { return "myPage"; }
    
    @PostMapping("/mypage")
    public String postMyPage() { return "myPage"; }
    
    @GetMapping("/editPassword")
    public String editPassword() { return "editPassword"; }
    
    @GetMapping("/editFacePic")
    public String editFacePic() { return "editFacePic"; }
    
    @GetMapping("/editBaseInfo")
    public String editBaseInfo() { return "editBaseInfo"; }
    
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
    public String editAnimalProfile() { return "editAnimalProfile"; }
    
    @GetMapping("/editAddress")
    public String editAddress() { return "editAddress"; }
    
    @GetMapping("/editHobby")
    public String editHobby() { return "editHobby"; }
    
    @GetMapping("/editMbti")
    public String editMbti() { return "editMbti"; }
    
    @GetMapping("/editSns")
    public String editSns() { return "editSns"; }
    
    @GetMapping("/editStyle")
    public String editStyle() { return "editStyle"; }
    
    @GetMapping("/editReligion")
    public String editReligion() { return "editReligion"; }
    
    @GetMapping("/editSmoke")
    public String editSmoke() { return "editSmoke"; }
    
    @GetMapping("/editIntroduce")
    public String editIntroduce() { return "editIntroduce"; }
}
