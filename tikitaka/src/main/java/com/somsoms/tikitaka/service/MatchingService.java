package com.somsoms.tikitaka.service;

import java.util.Date;
import java.util.ArrayList;
import java.util.Collections;
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
    
    private List<User> getCandidatesByPriorityStep(int requesterId, Idealtype ideal, String p1, String p2, String p3) {
        List<User> result = new ArrayList<>();

        // 1순위
        List<User> first = filterByPriority(requesterId, ideal, p1);
        List<User> firstPicked = pickRandom(first, 3);
        result.addAll(firstPicked);
        if (result.size() >= 3) return result;

        // 2순위 (1순위 중복 제거)
        List<User> second = filterByPriority(requesterId, ideal, p2);
        second.removeAll(result);
        List<User> secondPicked = pickRandom(second, 3 - result.size());
        result.addAll(secondPicked);
        if (result.size() >= 3) return result;

        // 3순위 (1,2순위 중복 제거)
        List<User> third = filterByPriority(requesterId, ideal, p3);
        third.removeAll(result);
        List<User> thirdPicked = pickRandom(third, 3 - result.size());
        result.addAll(thirdPicked);
        if (result.size() >= 3) return result;

        // 랜덤 (1,2,3순위 전부 중복 제거)
        List<User> random = getCompletelyRandom(requesterId);
        random.removeAll(result);
        List<User> randomPicked = pickRandom(random, 3 - result.size());
        result.addAll(randomPicked);

        return result;
    }
    
    private List<User> pickRandom(List<User> list, int count) {
        Collections.shuffle(list);
        return list.stream().limit(count).toList();
    }
    
    private List<User> getCompletelyRandom(int requesterId) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<User> cq = cb.createQuery(User.class);
        Root<User> user = cq.from(User.class);

        Predicate excludeSelf = cb.notEqual(user.get("userId"), requesterId);
        cq.where(excludeSelf);
        cq.orderBy(cb.asc(cb.function("DBMS_RANDOM.VALUE", Double.class)));

        return entityManager.createQuery(cq)
                .setMaxResults(3)
                .getResultList();
    }

    private List<User> filterByPriority(int requesterId, Idealtype ideal, String priority) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<User> cq = cb.createQuery(User.class);
        Root<User> user = cq.from(User.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(cb.notEqual(user.get("userId"), requesterId));

        switch (priority) {
            case "나이" -> predicates.add(cb.between(user.get("age"), ideal.getItAge() - 2, ideal.getItAge() + 2));
            case "키" -> predicates.add(cb.between(user.get("height"), ideal.getItHeight() - 5, ideal.getItHeight() + 5));
            case "거주지" -> predicates.add(cb.equal(user.get("address"), ideal.getItAddress()));
            case "MBTI" -> predicates.add(cb.equal(user.get("mbti"), ideal.getItMbti()));
            case "관심사" -> predicates.add(cb.equal(user.get("hobby"), ideal.getItHobby()));
            case "흡연유무" -> predicates.add(cb.equal(user.get("smoke"), ideal.getItSmoke()));
            case "종교" -> predicates.add(cb.equal(user.get("facialType"), ideal.getItFacialtype()));
        }

        cq.where(cb.and(predicates.toArray(new Predicate[0])));
        cq.orderBy(cb.asc(cb.function("DBMS_RANDOM.VALUE", Double.class)));

        return entityManager.createQuery(cq).getResultList();
    }
	
	void respondToMatching(int matchId, String status) {}
	  // updateMatchStatus로 결과 업데이트

	
	

	Matching getMatchingResult(int matchId) {
        return null;}
	  // findResultByMatchId로 매칭 하나의 결과 받아오기
	  // 이 결과로 매칭된 유저 프로필도 가져올 수 있음

	public List<User> getMatchingResults(int userId, String requestType) {
	    
	    List<Integer> matchingResultId = matchingResultRepository.findResultIdsByUserIdAndRequestType(userId, requestType);
	    
	    List<Matching> matchings = matchingRepository.findByMatchingResult_ResultIdIn(matchingResultId);
	    List<Integer> matchedUserIds = new ArrayList<>();
	    for (Matching m : matchings) {
	        matchedUserIds.add(m.getMatchedUserId());
	    }
	    
	    return userRepository.findAllById(matchedUserIds);
    }
	
	public boolean getMatchingStatus(int userId, String requestType) {
        
        List<Integer> matchingResultId = matchingResultRepository.findResultIdsByUserIdAndRequestType(userId, requestType);
        System.out.println(userId+"/"+requestType);
        System.out.println("matchingResultId 리스트 값:");
        for (Integer id : matchingResultId) {
            System.out.println("  -> " + id);
        }
        if (matchingResultId == null || matchingResultId.isEmpty()) {
            return true;
        }

        // 값이 있으면 false 반환
        return false;
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
	public void requestMatching(int requesterId, String priority1, String priority2, String priority3, String requestType) {
	    User requester = userRepository.findById(requesterId).orElseThrow();
	    Idealtype ideal = idealtypeRepository.findByUser_UserId(requesterId);

	    // 1. MatchingResult 생성
	    MatchingResult result = new MatchingResult();
	    result.setUser(requester);
	    result.setRequestType(requestType); // 예시로 일반 요청이라 가정
	    result.setRequestTime(new Date());
	    matchingResultRepository.save(result);

	    // 2. 전체 유저 중 3명 추천 (임의 예시: 무작위 3명)
	    List<User> candidates = getCandidatesByPriorityStep(requesterId, ideal, priority1, priority2, priority3);

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