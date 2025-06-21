package com.somsoms.tikitaka.service;

import java.util.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.repository.*;

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
    
    @Autowired
    private AlarmRepository alarmRepository;
    
    @PersistenceContext
    private EntityManager entityManager;
    
    private List<User> getCandidatesByPriorityStep(int requesterId, Idealtype ideal, String p1, String p2, String p3, String requestType, String requesterGender) {
        List<User> result = new ArrayList<>();

        List<User> first = filterByPriority(requesterId, ideal, p1, requestType, requesterGender);
        List<User> firstPicked = pickRandom(first, 3);
        result.addAll(firstPicked);
        if (result.size() >= 3) return result;

        List<User> second = filterByPriority(requesterId, ideal, p2, requestType, requesterGender);
        second.removeAll(result);
        List<User> secondPicked = pickRandom(second, 3 - result.size());
        result.addAll(secondPicked);
        if (result.size() >= 3) return result;

        List<User> third = filterByPriority(requesterId, ideal, p3, requestType, requesterGender);
        third.removeAll(result);
        List<User> thirdPicked = pickRandom(third, 3 - result.size());
        result.addAll(thirdPicked);
        
        // 🔽 성별만 유지한 랜덤 후보 보충
        List<User> random = getRandomByGenderOnly(requesterId, requestType, requesterGender);
        random.removeAll(result);
        List<User> randomPicked = pickRandom(random, 3 - result.size());
        result.addAll(randomPicked);

        return result;
    }
    
    private List<User> pickRandom(List<User> list, int count) {
        Collections.shuffle(list);
        return list.stream().limit(count).toList();
    }
    
    private List<User> getRandomByGenderOnly(int requesterId, String requestType, String requesterGender) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<User> cq = cb.createQuery(User.class);
        Root<User> user = cq.from(User.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(cb.notEqual(user.get("userId"), requesterId));

        // 성별 조건만 유지
        if ("F".equals(requestType)) {
            predicates.add(cb.equal(user.get("gender"), requesterGender)); // 동성
        } else if ("I".equals(requestType)) {
            predicates.add(cb.notEqual(user.get("gender"), requesterGender)); // 이성
        }

        cq.where(cb.and(predicates.toArray(new Predicate[0])));
        cq.orderBy(cb.asc(cb.function("DBMS_RANDOM.VALUE", Double.class)));

        return entityManager.createQuery(cq).getResultList();
    }

    private List<User> filterByPriority(int requesterId, Idealtype ideal, String priority, String requestType, String requesterGender) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<User> cq = cb.createQuery(User.class);
        Root<User> user = cq.from(User.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(cb.notEqual(user.get("userId"), requesterId));

        // ✅ 성별 필터 추가
        if ("F".equals(requestType)) {
            predicates.add(cb.equal(user.get("gender"), requesterGender)); // 동성만
        } else if ("I".equals(requestType)) {
            predicates.add(cb.notEqual(user.get("gender"), requesterGender)); // 이성만
        }

        switch (priority) {
            case "나이" -> predicates.add(cb.between(user.get("age"), ideal.getItAge() - 2, ideal.getItAge() + 2));
            case "키" -> predicates.add(cb.between(user.get("height"), ideal.getItHeight() - 5, ideal.getItHeight() + 5));
            case "거주지" -> predicates.add(cb.equal(user.get("address"), ideal.getItDistancePref()));
            case "MBTI" -> predicates.add(cb.equal(user.get("mbti"), ideal.getItMbti()));
            case "관심사" -> predicates.add(cb.equal(user.get("hobby"), ideal.getItHobby()));
            case "흡연유무" -> predicates.add(cb.equal(user.get("smoke"), ideal.getItSmoke()));
            case "종교" -> predicates.add(cb.equal(user.get("facialType"), ideal.getItFacialtype()));
        }

        cq.where(cb.and(predicates.toArray(new Predicate[0])));
        cq.orderBy(cb.asc(cb.function("DBMS_RANDOM.VALUE", Double.class)));

        return entityManager.createQuery(cq).getResultList();
    }

	public List<Matching> getMatchingResults(int userId, String requestType) {
	    List<Integer> matchingResultId = matchingResultRepository.findResultIdsByUserIdAndRequestType(userId, requestType);
	    
	    return matchingRepository.findByMatchingResult_ResultIdIn(matchingResultId);
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
            System.out.println(match.getMatchedUserId() + "," + idealId);
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
	    List<User> candidates = getCandidatesByPriorityStep(
                requesterId, ideal, priority1, priority2, priority3, requestType, requester.getGender()
            );
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
	
	//알람 전송
	@Transactional
	public void sendMatchRequest(int senderId, int receiverId) {
	    User sender = userRepository.findById(senderId).orElseThrow();
	    User receiver = userRepository.findById(receiverId).orElseThrow();

	    Optional<Matching> existingMatch = matchingRepository
	    	    .findByUser_UserIdAndMatchedUserId(sender.getUserId(), receiver.getUserId());
	    Matching match = existingMatch.get();
	    
	    Alarm alarm = new Alarm();
	    alarm.setSender(sender);
	    alarm.setReceiver(receiver);
	    alarm.setContent("새로운 매칭 요청이 도착했습니다!");
	    alarm.setIsChecked("N");
	    alarm.setMatching(match);
	    alarmRepository.save(alarm);
	}
	
	@Transactional
	public void acceptMatch(int matchId) {
	    Matching match = matchingRepository.findById(matchId).orElseThrow();
	    match.setStatus("ACCEPTED");
	    match.setRespondTime(new Date());
	}
	
	@Transactional
	public void rejectMatch(int matchId) {
	    Matching match = matchingRepository.findById(matchId).orElseThrow();
	    match.setStatus("REJECTED");
	    match.setRespondTime(new Date());
	}
}