package com.somsoms.tikitaka.controller;

import java.util.ArrayList;
import java.util.List;
import com.somsoms.tikitaka.domain.*;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/match")
public class MatchingController {
	@GetMapping("/prioritySelect")
	public String showIdealTypeLanking() {
		return "prioritySelect";
	}
	
	@GetMapping("/matchingResultPage")
	public String showMatchingResultPage() {
		return "matchingResultPage";
	}
	
	@PostMapping("/matchRequestDone")
	public String showMatchRequestDone() {
		return "matchRequestDone";
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
