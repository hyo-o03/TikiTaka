package com.somsoms.tikitaka.controller;

import com.somsoms.tikitaka.dao.IdealtypeDao;
import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.repository.IdealtypeRepository;
import com.somsoms.tikitaka.repository.UserRepository;
import com.somsoms.tikitaka.service.IdealtypeService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/ideal")
public class IdealtypeController {
    
    @Autowired
    private UserRepository userRepository;
        
    @Autowired
    private IdealtypeRepository idealtypeRepository;
    
    @GetMapping("/idealTypeChoice")
    public String idealTypeChoice() {
        return "idealTypeChoice";
    }
    @GetMapping("/friendIdealTypeChoice")
    public String showFriendIdealTypeChoicePage() {
        return "friendIdealTypeChoice"; // friendIdealTypeChoice.jsp 보여주기
    }
	
    @GetMapping("/checkIdealForm")
    public String checkIdealForm() {
        return "checkIdealForm";
    }
    
    @PostMapping("/idealAge")
    public String saveAge(@RequestParam("ageDif") String ageDif,
                          @RequestParam("age") int age,
                          HttpSession session) {

        int userId = (Integer) session.getAttribute("userId");
        User user = userRepository.findById(userId).orElseThrow();
        Idealtype ideal = idealtypeRepository.findByUser_UserId(userId);
        
        ideal.setItAgePreference(ageDif);
        ideal.setItAge(age);

        session.setAttribute("idealForm", ideal);
        return "redirect:/ideal/idealHeight"; // 다음 단계 이동
    }
    
    @GetMapping("/idealAnimalProfile")
    public String idealAnimalProfile() {
        return "idealAnimalProfile";
    }
    
    @PostMapping("/idealHeight")
    public String idealHeight() {
        return "idealHeight";
    }
    
    @PostMapping("/idealHobby")
    public String idealHobby() {
        return "idealHobby";
    }
    
    @PostMapping("/idealMbti")
    public String idealMbti() {
        return "idealMbti";
    }
    
    @PostMapping("/idealSmoke")
    public String idealSmoke() {
        return "idealSmoke";
    }
    
    @PostMapping("/idealStyle")
    public String idealStyle() {
        return "idealStyle";
    }
	
    private IdealtypeService idealtypeService;

    public ResponseEntity<Idealtype> getIdealtype(@PathVariable Long userId) {
        return null;
    }
    
    public ResponseEntity<String> updateIdealtype(@RequestBody Idealtype idealtypeCommand) {
        return null;
    }

}
