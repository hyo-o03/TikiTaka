package com.somsoms.tikitaka.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.repository.*;
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
    private UserRepository userRepository;
    
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
		
		return "redirect:/match/matchingResultPage";
	}
	
	@GetMapping("/matchingResultPage")
	public String showMatchingResultPage(HttpSession session, Model model) {
	    Integer userId = (Integer) session.getAttribute("userId"); // 세션에서 userId 꺼내기

	    if (userId == null) {  // 세션 만료 또는 로그인 안 된 상태
	        return "redirect:/signup/login";
	    }

	    List<Matching> matchingList = matchingService.getMatchingResults(userId, "I");
	    model.addAttribute("matchingList", matchingList);
	    
		return "matchingResultPage";
	}
	
	@GetMapping("/friendMatchingResultPage")
    public String showFriendMatchingResultPage(HttpSession session, Model model) {
        
	    Integer userId = (Integer) session.getAttribute("userId"); // 세션에서 userId 꺼내기

	    if (userId == null) {  // 세션 만료 또는 로그인 안 된 상태
	        return "redirect:/signup/login";
	    }
        
	    List<Matching> matchingList = matchingService.getMatchingResults(userId, "F");       
        model.addAttribute("matchingList", matchingList);
        
        return "matchingResultPage";
    }
	
	@GetMapping("/idealTypeInfo")
    public String showIdealTypeInfo(
    		@RequestParam("address") String address, 
    		@RequestParam("age") int age, 
    		@RequestParam("hobby") String hobby, 
    		@RequestParam("religion") String religion, 
    		@RequestParam("smoke") String smoke, 
    		@RequestParam("introduce") String introduce,
    		@RequestParam("userId") int userId, 
    		@RequestParam("facialType") String facialType,
    		@RequestParam("kakaoId") String kakaoId,
    		@RequestParam("matchId") int matchId,
    		@RequestParam("status") String status,
    		HttpSession session,
    		Model model) {
        // 디버깅용 로그 추가
//        System.out.println("IdealType Data: " + place + ", " + age + ", " + introduce + ", " + imageUrl);

        // 모델에 데이터를 담아서 뷰로 전달
        User userInfo = new User(address, age, hobby, religion, smoke, introduce, userId, facialType, kakaoId);
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("matchId", matchId);
        model.addAttribute("status", status);
        
        // ✅ [세션 기반 응답 여부 체크 로직]
        Set<Integer> respondedMatchIds = (Set<Integer>) session.getAttribute("respondedMatches");
        boolean responded = respondedMatchIds != null && respondedMatchIds.contains(matchId);

        model.addAttribute("responded", responded);
        
        return "idealTypeInfo";
    }
	
	@GetMapping("/idealTypeInfoInAlarm")
    public String idealTypeInfoInAlarm(
    		@RequestParam("address") String address, 
    		@RequestParam("age") int age, 
    		@RequestParam("hobby") String hobby, 
    		@RequestParam("religion") String religion, 
    		@RequestParam("smoke") String smoke, 
    		@RequestParam("introduce") String introduce,
    		@RequestParam("userId") int userId, 
    		@RequestParam("facialType") String facialType,
    		@RequestParam("kakaoId") String kakaoId,
    		@RequestParam("matchId") int matchId,
    		@RequestParam("status") String status,
    		Model model) {
        // 디버깅용 로그 추가
//        System.out.println("IdealType Data: " + place + ", " + age + ", " + introduce + ", " + imageUrl);

        // 모델에 데이터를 담아서 뷰로 전달
		User userInfo = new User(address, age, hobby, religion, smoke, introduce, userId, facialType, kakaoId);
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("matchId", matchId);
        model.addAttribute("status", status);
        
        return "idealTypeInfoInAlarm";
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

        return "redirect:/match/matchRequestDone"; // 결과 페이지로 이동
    }
	
	@PostMapping("/sendRequest")
	public String sendMatchRequest(
			@RequestParam("matchedUserId") int matchedUserId, 
			@RequestParam("matchId") int matchId,
			HttpSession session) {
	    int userId = (Integer)session.getAttribute("userId");
	    matchingService.sendMatchRequest(userId, matchedUserId);
	    
	    // ✅ 세션에 응답 여부 기록
	    Set<Integer> respondedMatchIds = (Set<Integer>) session.getAttribute("respondedMatches");
	    if (respondedMatchIds == null) {
	        respondedMatchIds = new HashSet<>();
	    }
	    respondedMatchIds.add(matchId);
	    session.setAttribute("respondedMatches", respondedMatchIds);
	    
	    return "redirect:/match/matchingResultPage"; // 또는 매칭 완료 페이지
	}
	
	@PostMapping("/sendRejected")
	public String sendRejected(@RequestParam("matchId") int matchId) {
//	    User sender = (User) session.getAttribute("loginUser");
		matchingService.rejectMatch(matchId);
	    
	    return "redirect:/match/matchingResultPage"; // 또는 매칭 완료 페이지
	}
	
	@PostMapping("/accept")
	public String acceptMatch(@RequestParam("matchId") int matchId) {
	    matchingService.acceptMatch(matchId);
	    
	    return "redirect:/user/home";
	}
	
	@PostMapping("/reject")
	public String rejectMatch(@RequestParam("matchId") int matchId) {
	    matchingService.rejectMatch(matchId);
	    
	    return "redirect:/user/home";
	}
	
	@GetMapping("/matchingPopup")
	public String showPopupFromAlarm(@RequestParam("matchId") int matchId, Model model) {
	    Matching match = matchingRepository.findById(matchId).orElseThrow();
	    User matchedUser = userRepository.findById(match.getMatchedUserId()).orElseThrow();

	    model.addAttribute("userInfo", matchedUser);
	    model.addAttribute("matchId", matchId);

	    return "idealTypeInfo"; // 위에서 작성한 팝업 JSP
	}
}
