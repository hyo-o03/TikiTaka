package com.somsoms.tikitaka.controller;

import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.service.FriendtypeService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/friend")
public class FriendtypeController {
	
	@Autowired
    private FriendtypeService friendtypeService;
	
	@PostMapping("/checkFriendForm")
    public String checkIdealForm(@RequestParam(name = "smoke", required = false) String smoke,
					            HttpSession session,
					            Model model) {
		int userId = (int) session.getAttribute("userId");
		Friendtype friend = friendtypeService.getFriendtypeByUserId(userId);
		
		if (friend != null) {
			if (smoke == null) {
				friend.setFtSmoke(null); // null이면 그대로 null
			} else if (smoke.trim().isEmpty()) {
				friend.setFtSmoke("상관없음"); // 빈 문자열이면 상관없음
			} else {
				friend.setFtSmoke(smoke); // 정상 값
			}            
			
			friendtypeService.updateFriendtype(friend);
		}

		return "redirect:/mypage/mypage"; // 완료 후 마이페이지 이동
    }
	
    @GetMapping("/friendAge")
    public String friendAge(HttpSession session, Model model) {
    	int userId = (int) session.getAttribute("userId");
		Friendtype friend = friendtypeService.getFriendtypeByUserId(userId);
		
		session.setAttribute("friend", friend);
	       
        return "friendAge";
    }
    
    @PostMapping("/friendAddress")
    public String friendAddress(@RequestParam String ageDif,
					            @RequestParam Integer age,
					            HttpSession session) {
    	int userId = (int) session.getAttribute("userId");
		Friendtype friend = friendtypeService.getFriendtypeByUserId(userId);
		
		if (friend != null) {
			friend.setFtAgePreference(ageDif);
			if (age == null) {
				friend.setFtAge(null); // 상관없음 → null 저장
			} else {
				friend.setFtAge(age);
			}
			friendtypeService.updateFriendtype(friend);
		}
		
        return "friendAddress";
    }
    
    @PostMapping("/friendHobby")
    public String friendHobby(@RequestParam(name = "ftDistancePref", required = false) String ftDistancePref,
				    		HttpSession session,
				            Model model) {
    	int userId = (int) session.getAttribute("userId");
    	Friendtype friend = friendtypeService.getFriendtypeByUserId(userId);
		
		if (friend != null) {
			if (ftDistancePref == null || ftDistancePref.trim().isEmpty()) {
				friend.setFtDistancePref(null);  // FT_DISTANCE_PREF에 null
	        } else {
	        	friend.setFtDistancePref(ftDistancePref);  // close / far
	        }
			friendtypeService.updateFriendtype(friend);
		}
		return "friendHobby";
    }
    
    @PostMapping("/friendMbti")
    public String friendMbti(@RequestParam String hobby,
		            		HttpSession session, Model model) {
    	int userId = (int) session.getAttribute("userId");
    	Friendtype friend = friendtypeService.getFriendtypeByUserId(userId);
		
        if (friend != null) {
        	friend.setFtHobby(hobby);
        	friendtypeService.updateFriendtype(friend);
        }
        
        return "friendMbti";
    }
    
    @PostMapping("/friendSmoke")
    public String friendSmoke(@RequestParam(name="mbti", required = false)String mbti,
				            HttpSession session,
				            Model model) {
    	int userId = (int) session.getAttribute("userId");
    	Friendtype friend = friendtypeService.getFriendtypeByUserId(userId);
        
        if (friend != null) {
        	if (mbti == null) {
        		friend.setFtMbti(null); // null이면 그대로 null
            } else if (mbti.trim().isEmpty()) {
            	friend.setFtMbti("상관없음"); // 빈 문자열이면 상관없음
            } else {
            	friend.setFtMbti(mbti); // 정상 값
            }
        	friendtypeService.updateFriendtype(friend);
        }
        
        return "friendSmoke";
    }

    public ResponseEntity<Friendtype> getFriendtype(@PathVariable Long userId) {
        return null;
    }
    
    public ResponseEntity<String> updateFriendtype(@RequestBody Friendtype friendtypeCommand) {
        return null;
    }

}
