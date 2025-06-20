package com.somsoms.tikitaka.controller;

import java.util.ArrayList;
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
import org.springframework.http.ResponseEntity;
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
    public String showPrioritySelect(@RequestParam("requestType") String requestType, Model model) {
        model.addAttribute("requestType", requestType); // <-- 이게 있어야 JSP에서 ${requestType} 가능
        return "prioritySelect"; // prioritySelect.jsp로 이동
    }

	@GetMapping("/idealTypeLanking")
	public String showIdealTypeLanking() {
		return "idealTypeLanking";
	}
	/*
	 * @GetMapping("/isMatchingResultPage") public String
	 * isMatchingResultPage(@RequestParam("matchedUserId") int matchedUserId, Model
	 * model) { model.addAttribute("matchedUserId", matchedUserId);
	 * 
	 * matchingRepository.acceptMatching(matchedUserId);
	 * 
	 * return "matchingResultPage"; }
	 */
	
	@GetMapping("/matchingResultPage")
	public String showMatchingResultPage(Model model) {
	    
	    int userId = 1066; //임시로 정해놈

	    List<Matching> matchingList = matchingService.getMatchingResults(userId, "I");
	    model.addAttribute("matchingList", matchingList);
	    
		return "matchingResultPage";
	}
	
	@GetMapping("/friendMatchingResultPage")
    public String showFriendMatchingResultPage(Model model) {
        int userId = 1066; //임시로 정해놈
        
        List<Matching> matchingList = matchingService.getMatchingResults(userId, "F");        
        model.addAttribute("matchingList", matchingList);
        
        return "matchingResultPage";
    }
	
//	@PostMapping("/matchRequestDone")
//	public String showMatchRequestDone() {
//		return "matchRequestDone";
//	}
	

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
	
//	@GetMapping("/matchRequestDone")
//	public String handleMatchRequest(@RequestParam("type") String type, int idealId) {
////	    User loginUser = (User) session.getAttribute("loginUser"); // 세션에서 로그인 사용자 가져오기
////
////	    if (loginUser == null) {
////	        return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
////	    }
//
//	    int userId = 4; // 로그인 유저 ID
//	    matchingService.acceptMatchesByUserId(userId, type, idealId); // 상태 변경 서비스 호출
//
//	    return "matchRequestDone"; // 결과 페이지로 이동
//	}
	
//	@RequestParam("type") String type, HttpSession session,
	@PostMapping("/matchRequestDone")
    public String handleMatchRequest2(
            @RequestParam String priority1,
            @RequestParam String priority2,
            @RequestParam String priority3,
            @RequestParam("requestType") String requestType,
            Model model) {
//      User loginUser = (User) session.getAttribute("loginUser"); // 세션에서 로그인 사용자 가져오기
//      
//      if (loginUser == null) {
//          return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
//      }
//      
//      int userId = loginUser.getUserId();
		int userId = 1067;

        matchingService.requestMatching(userId, priority1, priority2, priority3, requestType);

        return "matchRequestDone"; // 결과 페이지로 이동
    }
	
	@PostMapping("/sendRequest")
	public String sendMatchRequest(
			@RequestParam("matchedUserId") int matchedUserId, 
			@RequestParam("matchId") int matchId,
			HttpSession session) {
//	    User sender = (User) session.getAttribute("loginUser");
	    matchingService.sendMatchRequest(1066, matchedUserId);
	    
	    // ✅ 세션에 응답 여부 기록
	    Set<Integer> respondedMatchIds = (Set<Integer>) session.getAttribute("respondedMatches");
	    if (respondedMatchIds == null) {
	        respondedMatchIds = new HashSet<>();
	    }
	    respondedMatchIds.add(matchId);
	    session.setAttribute("respondedMatches", respondedMatchIds);
	    
	    return "matchingResultPage"; // 또는 매칭 완료 페이지
	}
	
	@PostMapping("/sendRejected")
	public String sendRejected(@RequestParam("matchId") int matchId) {
//	    User sender = (User) session.getAttribute("loginUser");
		matchingService.rejectMatch(matchId);
	    
	    return "matchingResultPage"; // 또는 매칭 완료 페이지
	}
	
	@PostMapping("/accept")
	public String acceptMatch(@RequestParam("matchId") int matchId) {
	    matchingService.acceptMatch(matchId);
	    
	    return "home";
	}
	
	@PostMapping("/reject")
	public String rejectMatch(@RequestParam("matchId") int matchId) {
	    matchingService.rejectMatch(matchId);
	    
	    return "home";
	}
	
	@GetMapping("/matchingPopup")
	public String showPopupFromAlarm(@RequestParam("matchId") int matchId, Model model) {
	    Matching match = matchingRepository.findById(matchId).orElseThrow();
	    User matchedUser = userRepository.findById(match.getMatchedUserId()).orElseThrow();

	    model.addAttribute("userInfo", matchedUser);
	    model.addAttribute("matchId", matchId);

	    return "idealTypeInfo"; // 위에서 작성한 팝업 JSP
	}
	
//	@PostMapping("/match/request")
//	public ResponseEntity<String> requestMatch(@RequestParam int userId) {}
//	//매칭 요청
//
//	@GetMapping("/match/result/all")
//	public ResponseEntity<List<Matching>> getMatchResults(@RequestParam int userId) {}
//	//매칭 모든 결과값
//
//	@GetMapping("/match/result/one")
//	public ResponseEntity<Matching> getMatchResult(@RequestParam int matchId) {}
//	//매칭 하나의 결과값
//
//	@PostMapping("/match/respond")
//	public ResponseEntity<String> respondToMatching(
//	    @RequestParam int matchId,
//	    @RequestParam String status // "ACCEPTED" or "REJECTED"
//	) {}

}
