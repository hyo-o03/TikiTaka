package com.somsoms.tikitaka.controller;

import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.service.FriendtypeService;

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

@Controller
@RequestMapping("/friend")
public class FriendtypeController {
	
    @GetMapping("/friendAge")
    public String friendAge() {
        return "friendAge";
    }
    
    @PostMapping("/friendAddress")
    public String friendAddress() {
        return "friendAddress";
    }
    
    @PostMapping("/friendHobby")
    public String friendHobby() {
        return "friendHobby";
    }
    
    @PostMapping("/friendMbti")
    public String friendMbti() {
        return "friendMbti";
    }
    
    @PostMapping("/friendSmoke")
    public String friendSmoke() {
        return "friendSmoke";
    }
	
	private FriendtypeService friendtypeService;

    public ResponseEntity<Friendtype> getFriendtype(@PathVariable Long userId) {
        return null;
    }
    
    public ResponseEntity<String> updateFriendtype(@RequestBody Friendtype friendtypeCommand) {
        return null;
    }

}
