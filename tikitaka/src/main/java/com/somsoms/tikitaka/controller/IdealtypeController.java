package com.somsoms.tikitaka.controller;

import com.somsoms.tikitaka.dao.IdealtypeDao;
import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.service.IdealtypeService;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ideal")
public class IdealtypeController {
	
    @GetMapping("/checkIdealForm")
    public String checkIdealForm() {
        return "checkIdealForm";
    }
    
    @PostMapping("/idealAge")
    public String idealAge() {
        return "idealAge";
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
