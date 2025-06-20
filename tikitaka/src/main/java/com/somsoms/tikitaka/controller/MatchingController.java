package com.somsoms.tikitaka.controller;

import java.util.List;
import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.repository.MatchingRepository;
import com.somsoms.tikitaka.service.IdealtypeService;
import com.somsoms.tikitaka.service.MatchingService;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/match")
public class MatchingController {
    
    @Autowired
    private MatchingService matchingService;
    
    @Autowired
    private IdealtypeService idealtypeService;
    
    @Autowired
    private MatchingRepository matchingRepository;
    
    @PostConstruct
    public void checkInit() {
        System.out.println("💡 IdealtypeService 주입 여부: " + idealtypeService);
    }


    @GetMapping("/prioritySelect")
    public String showPrioritySelect(@RequestParam("requestType") String requestType, HttpSession session, Model model) {
        model.addAttribute("requestType", requestType); // <-- 이게 있어야 JSP에서 ${requestType} 가능
        

        Integer userId = (Integer) session.getAttribute("userId"); // 세션에서 userId 꺼내기

        if (userId == null) {  // 세션 만료 또는 로그인 안 된 상태
            return "redirect:/signup/login";
        }
        
        boolean b = matchingService.getMatchingStatus(userId, requestType);
        model.addAttribute("status", b);
        
        return "prioritySelect"; // prioritySelect.jsp로 이동
    }


	@GetMapping("/idealTypeLanking")
	public String showIdealTypeLanking() {
		return "idealTypeLanking";
	}
	
	@GetMapping("/isMatchingResultPage")
	public String isMatchingResultPage(@RequestParam("matchedUserId") int matchedUserId, HttpSession session, Model model) {
		model.addAttribute("matchedUserId", matchedUserId);
		 
		matchingRepository.acceptMatching(matchedUserId);
		
		return "matchingResultPage";
	}
	
	@GetMapping("/matchingResultPage")
	public String showMatchingResultPage(HttpSession session, Model model) {
	    
	    Integer userId = (Integer) session.getAttribute("userId"); // 세션에서 userId 꺼내기

	    if (userId == null) {  // 세션 만료 또는 로그인 안 된 상태
	        return "redirect:/signup/login";
	    }
	    
        System.out.println("세션에서 가져온 로그인 아이디: "+userId);

	    List<User> matchingList = matchingService.getMatchingResults(userId, "I");

	    model.addAttribute("matchingList", matchingList);
	    
		return "matchingResultPage";
	}
	
	@GetMapping("/friendMatchingResultPage")
    public String showFriendMatchingResultPage(HttpSession session, Model model) {
        
	    Integer userId = (Integer) session.getAttribute("userId"); // 세션에서 userId 꺼내기

	    if (userId == null) {  // 세션 만료 또는 로그인 안 된 상태
	        return "redirect:/signup/login";
	    }
        
        List<User> matchingList = matchingService.getMatchingResults(userId, "F");        
        model.addAttribute("matchingList", matchingList);
        
        return "matchingResultPage";
    }
	
	

	@GetMapping("/idealTypeInfo")
    public String showIdealTypeInfo(@RequestParam("address") String address, @RequestParam("age") int age, @RequestParam("introduce") String introduce, @RequestParam("userId") int userId, @RequestParam("facialType") String facialType, HttpSession session, Model model) {
        // 디버깅용 로그 추가
//        System.out.println("IdealType Data: " + place + ", " + age + ", " + introduce + ", " + imageUrl);

        // 모델에 데이터를 담아서 뷰로 전달
        User userInfo = new User(address, age, introduce, userId, facialType);
        System.out.println("User Data: " + address + ", " + age + ", " + introduce +", " + userId + "," + facialType);
        model.addAttribute("userInfo", userInfo);
        
        return "idealTypeInfo";
    }
	
	
	@PostMapping("/matchRequestDone")
    public String handleMatchRequest2(
            @RequestParam String priority1,
            @RequestParam String priority2,
            @RequestParam String priority3,
            @RequestParam("requestType") String requestType,
            HttpSession session,
            Model model) {
     
	    Integer userId = (Integer) session.getAttribute("userId"); // 세션에서 userId 꺼내기

	    if (userId == null) {  // 세션 만료 또는 로그인 안 된 상태
	        return "redirect:/signup/login";
	    }

        matchingService.requestMatching(userId, priority1, priority2, priority3, requestType);

        return "matchRequestDone"; // 결과 페이지로 이동
    }
	

}
