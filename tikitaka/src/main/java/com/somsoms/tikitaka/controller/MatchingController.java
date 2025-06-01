package com.somsoms.tikitaka.controller;

import java.util.ArrayList;
import java.util.List;
import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.service.MatchingService;



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
    
	@GetMapping("/prioritySelect")
	public String showPrioritySelect() {
		return "prioritySelect";
	}
	
	@GetMapping("/matchingResultPage")
	public String showMatchingResultPage(Model model) {
	    
	    int userId = 4; //임시로 정해놈
	    
	    List<User> matchingList = matchingService.getMatchingResults(userId);	    
	    model.addAttribute("matchingList", matchingList);
	    
		return "matchingResultPage";
	}
	
	@PostMapping("/matchRequestDone")
	public String showMatchRequestDone() {
		return "matchRequestDone";
	}
	
	@GetMapping("/idealTypeInfo")
    public String showIdealTypeInfo(@RequestParam("address") String address, @RequestParam("age") int age, @RequestParam("introduce") String introduce, @RequestParam("userId") int userId, Model model) {
        // 디버깅용 로그 추가
//        System.out.println("IdealType Data: " + place + ", " + age + ", " + introduce + ", " + imageUrl);

        // 모델에 데이터를 담아서 뷰로 전달
        User userInfo = new User(address, age, introduce, userId);
        System.out.println("User Data: " + address + ", " + age + ", " + introduce +", "+userId);
        model.addAttribute("userInfo", userInfo);
        return "idealTypeInfo";
    }
	
	@GetMapping("/matchRequestDone")
	public String handleMatchRequest(@RequestParam("type") String type, int idealId) {
//	    User loginUser = (User) session.getAttribute("loginUser"); // 세션에서 로그인 사용자 가져오기
//
//	    if (loginUser == null) {
//	        return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
//	    }

	    int userId = 4; // 로그인 유저 ID
	    matchingService.acceptMatchesByUserId(userId, type, idealId); // 상태 변경 서비스 호출

	    return "matchRequestDone"; // 결과 페이지로 이동
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
