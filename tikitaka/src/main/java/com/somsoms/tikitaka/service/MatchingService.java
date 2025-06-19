package com.somsoms.tikitaka.service;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.repository.FriendtypeRepository;
import com.somsoms.tikitaka.repository.IdealtypeRepository;
import com.somsoms.tikitaka.repository.MatchingRepository;
import com.somsoms.tikitaka.repository.MatchingResultRepository;
import com.somsoms.tikitaka.repository.UserRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;

@Service
public class MatchingService {
    
    @Autowired
    private MatchingRepository matchingRepository;
    
    @Autowired
    private MatchingResultRepository matchingResultRepository;
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private IdealtypeRepository idealtypeRepository;
    
    @PersistenceContext
    private EntityManager entityManager;

	private List<User> findCandidatesByPriorities(int requesterId, Idealtype ideal, String p1, String p2, String p3) {
	    CriteriaBuilder cb = entityManager.getCriteriaBuilder();
	    CriteriaQuery<User> cq = cb.createQuery(User.class);
	    Root<User> user = cq.from(User.class);

	    List<Predicate> predicates = new ArrayList<>();
	    predicates.add(cb.notEqual(user.get("userId"), requesterId));

	    for (String priority : List.of(p1, p2, p3)) {
	        switch (priority) {
	            case "나이" -> predicates.add(cb.greaterThanOrEqualTo(user.get("age"), ideal.getItAge()));
	            case "키" -> predicates.add(cb.greaterThanOrEqualTo(user.get("height"), ideal.getItHeight()));
	            case "거주지" -> predicates.add(cb.equal(user.get("address"), ideal.getItAddress()));
	            case "MBTI" -> predicates.add(cb.equal(user.get("mbti"), ideal.getItMbti()));
	            case "관심사" -> predicates.add(cb.equal(user.get("hobby"), ideal.getItHobby()));
	            case "흡연유무" -> predicates.add(cb.equal(user.get("smoke"), ideal.isItSmoke()));
	            case "종교" -> predicates.add(cb.equal(user.get("facialType"), ideal.getItFacialtype())); // 여기에 종교 저장된 거 맞지?
	        }
	    }

	    cq.where(predicates.toArray(new Predicate[0]));
	    cq.orderBy(cb.asc(cb.function("DBMS_RANDOM.VALUE", Double.class))); // 랜덤 정렬 유지
	    return entityManager.createQuery(cq).setMaxResults(3).getResultList();
	}
	
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
	    MatchingResult result = matchingResultRepository.findByUserUserIdAndRequestType(userId, type);
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

	@Transactional
	public void requestMatching(int requesterId, String priority1, String priority2, String priority3) {
	    User requester = userRepository.findById(requesterId).orElseThrow();
	    Idealtype ideal = idealtypeRepository.findByUser_UserId(requesterId);

	    // 1. MatchingResult 생성
	    MatchingResult result = new MatchingResult();
	    result.setUser(requester);
	    result.setRequestType("F"); // 예시로 일반 요청이라 가정
	    result.setRequestTime(new Date());
	    matchingResultRepository.save(result);

	    // 2. 전체 유저 중 3명 추천 (임의 예시: 무작위 3명)
	    List<User> candidates = findCandidatesByPriorities(requesterId, ideal, priority1, priority2, priority3);
	    		userRepository.findMatchingUser(requesterId); // 쿼리로 exclude 처리

	    // 3. Matching 3건 생성
	    for (User matched : candidates) {
	        Matching m = new Matching();
	        m.setMatchingResult(result);
	        m.setUser(requester);
	        m.setMatchedUserId(matched.getUserId());
	        m.setStatus("REQUESTED");  // 응답 대기 중
	        m.setRespondTime(null);

	        matchingRepository.save(m);
	    }
	}
	
	//매칭 삭제용
	@Scheduled(cron = "0 0 4 * * *", zone = "Asia/Seoul")
	@Transactional
	public void deleteMatchingResult() {
		matchingRepository.deleteNotToday();
        matchingResultRepository.deleteNotToday();
	}
}