package com.somsoms.tikitaka.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.repository.FriendtypeRepository;
import com.somsoms.tikitaka.repository.MatchingRepository;
import com.somsoms.tikitaka.repository.MatchingresultRepository;
import com.somsoms.tikitaka.repository.UserRepository;

@Service
public class MatchingService {
    
    @Autowired
    private MatchingRepository matchingRepository;
    
    @Autowired
    private MatchingresultRepository matchingresultRepository;
    
    @Autowired
    private UserRepository userRepository;
	
	void requestMatching(int userId) {}
	  // MatchingResult에서 user_id로 생성된 매칭결과가 있는지 확인
	  // 있다면 매칭 불가
	  // 없다면 findItypeByUserId 혹은 findFtypeByUserId로 유저 조건에 맞는 매칭 진행
	  // MatchingResult, Matching에 insert

	void respondToMatching(int matchId, String status) {}
	  // updateMatchStatus로 결과 업데이트

	Matching getMatchingResult(int matchId) {
        return null;}
	  // findResultByMatchId로 매칭 하나의 결과 받아오기
	  // 이 결과로 매칭된 유저 프로필도 가져올 수 있음

	public List<User> getMatchingResults(int userId) {
	    List<Matching> matchings = matchingRepository.findByUser_UserId(userId);
	    
	    List<Integer> matchedUserIds = new ArrayList<>();
	    for (Matching m : matchings) {
	        matchedUserIds.add(m.getMatchedUserId());
	    }
	    
	    return userRepository.findAllById(matchedUserIds);
    }
	
	public void acceptMatchesByUserId(int userId, String type, int idealId) {
	    MatchingResult result = matchingresultRepository.findByUserUserIdAndRequestType(userId, type);
        if (result == null) return;
        System.out.println(result.getResultId());
        
        List<Matching> matchList = matchingRepository.findByMatchingResultResultId(result.getResultId());
        
        for (Matching match : matchList) {
            System.out.println(match.getMatchedUserId()+","+idealId);
            if(match.getMatchedUserId() == idealId)
                match.setStatus("ACCEPTED");
            else
                match.setStatus("REJECTED");
        }
        matchingRepository.saveAll(matchList);
    }
	
	
	
	
	
	
	  // findAllResultByUserId로 매칭 전체 결과 받아오기

	void deleteMatchingResult() {}
	  // MatchingResult의 모든 유저의 요청 시간과 현재 시간을 비교
	  // 24시간이 지났다면 delete
	  // @Scheduled annotation으로 특정 시간마다 지속적으로 실행 *
	
}