package com.somsoms.tikitaka.controller;

import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.service.IdealtypeService;
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
@RequestMapping("/ideal")
public class IdealtypeController {

    @GetMapping("/idealTypeChoice")
    public String idealTypeChoice() {
        return "idealTypeChoice";
    }
    
    @GetMapping("/friendIdealTypeChoice")
    public String friendIdealTypeChoice() {
        return "friendIdealTypeChoice";
    }
 
	@Autowired
    private IdealtypeService idealtypeService;
	
    @PostMapping("/checkIdealForm")
    public String checkIdealForm(@RequestParam(name = "religion", required = false) String religion,
    							HttpSession session) {
    	int userId = (int) session.getAttribute("userId");
        Idealtype ideal = idealtypeService.getIdealtypeByUserId(userId);

        if (ideal != null) {
        	ideal.setItReligion(religion);
            idealtypeService.updateIdealtype(ideal);
        }		

		return "redirect:/mypage/mypage"; // 완료 후 마이페이지 이동
    }
    
    @GetMapping("/idealAnimalProfile")
    public String idealAnimalProfile(HttpSession session, Model model) {
        int userId = (int) session.getAttribute("userId");
        Idealtype ideal = idealtypeService.getIdealtypeByUserId(userId);
        session.setAttribute("ideal", ideal);
       
        return "idealAnimalProfile";
    }
    
    @PostMapping("/idealAge")
    public String idealAge(@RequestParam String facialType, HttpSession session, Model model) {
    	int userId = (int) session.getAttribute("userId");
        Idealtype ideal = idealtypeService.getIdealtypeByUserId(userId);

        if (ideal != null) {
            ideal.setItFacialtype(facialType);
            idealtypeService.updateIdealtype(ideal);
        }

        return "idealAge"; // 다음 단계로 이동
    }
    
    @PostMapping("/idealHeight")
    public String idealHeight(@RequestParam String ageDif,
                              @RequestParam Integer age,
                              HttpSession session) {
    	int userId = (int) session.getAttribute("userId");
        Idealtype ideal = idealtypeService.getIdealtypeByUserId(userId);

        if (ideal != null) {
            ideal.setItAgePreference(ageDif);
            if (age == null) {
                ideal.setItAge(null); // 상관없음 → null 저장
            } else {
                ideal.setItAge(age);
            }
            idealtypeService.updateIdealtype(ideal);
        }

        return "idealHeight";
    }
    
    @PostMapping("/idealAddress")
    public String idealAddress(@RequestParam Double height,
					            HttpSession session,
					            Model model) {
		int userId = (int) session.getAttribute("userId");
		Idealtype ideal = idealtypeService.getIdealtypeByUserId(userId);
		
		if (ideal != null) {
			ideal.setItHeight(height);
			idealtypeService.updateIdealtype(ideal);
		}
		return "idealAddress";
    }
    
    
    @PostMapping("/idealHobby")
    public String idealHobby(@RequestParam(name = "itDistancePref", required = false) String itDistancePref,
				    		HttpSession session,
				            Model model) {
    	int userId = (int) session.getAttribute("userId");
		Idealtype ideal = idealtypeService.getIdealtypeByUserId(userId);
		
		if (ideal != null) {
			if (itDistancePref == null || itDistancePref.trim().isEmpty()) {
		        ideal.setItDistancePref(null); // 선택 안 하면 null로 저장
		    } else {
		        ideal.setItDistancePref(itDistancePref);
		    }
			idealtypeService.updateIdealtype(ideal);
		}
		return "idealHobby";
    }
    
    @PostMapping("/idealMbti")
    public String idealMbti(@RequestParam String hobby,
		            		HttpSession session, Model model) {
    	int userId = (int) session.getAttribute("userId");
		Idealtype ideal = idealtypeService.getIdealtypeByUserId(userId);
		
        if (ideal != null) {
        	ideal.setItHobby(hobby);
            idealtypeService.updateIdealtype(ideal);
        }
        
        return "idealMbti";
    }
    
    @PostMapping("/idealSmoke")
    public String idealSmoke(@RequestParam(name="mbti", required = false)String mbti,
				            HttpSession session,
				            Model model) {
    	int userId = (int) session.getAttribute("userId");
        Idealtype ideal = idealtypeService.getIdealtypeByUserId(userId);
        
        if (ideal != null) {
        	if (mbti == null) {
                ideal.setItMbti(null); // null이면 그대로 null
            } else if (mbti.trim().isEmpty()) {
                ideal.setItMbti("상관없음"); // 빈 문자열이면 상관없음
            } else {
                ideal.setItMbti(mbti); // 정상 값
            }
        	idealtypeService.updateIdealtype(ideal);
        }
        
        return "idealSmoke";
    }
    
    @PostMapping("/idealStyle")
    public String idealStyle(@RequestParam(name = "smoke", required = false) String smoke,
				            HttpSession session,
				            Model model) {
    	int userId = (int) session.getAttribute("userId");
        Idealtype ideal = idealtypeService.getIdealtypeByUserId(userId);
        
        if (ideal != null) {
        	if (smoke == null) {
                ideal.setItSmoke(null); // null이면 그대로 null
            } else if (smoke.trim().isEmpty()) {
                ideal.setItSmoke("상관없음"); // 빈 문자열이면 상관없음
            } else {
                ideal.setItSmoke(smoke); // 정상 값
            }
        	
        	idealtypeService.updateIdealtype(ideal);
        }
        
        return "idealStyle";
    }
    
    @PostMapping("/idealReligion")
    public String idealReligion(@RequestParam String fashion,
    							HttpSession session) {
    	int userId = (int) session.getAttribute("userId");
        Idealtype ideal = idealtypeService.getIdealtypeByUserId(userId);

        if (ideal != null) {
        	ideal.setItFashion(fashion);
            idealtypeService.updateIdealtype(ideal);
        }		
        return "idealReligion";
    }

    public ResponseEntity<Idealtype> getIdealtype(@PathVariable Long userId) {
        return null;
    }
    
    public ResponseEntity<String> updateIdealtype(@RequestBody Idealtype idealtypeCommand) {
        return null;
    }

}
