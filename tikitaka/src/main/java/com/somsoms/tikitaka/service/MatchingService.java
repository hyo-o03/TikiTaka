package com.somsoms.tikitaka.service;

import java.util.List;
import com.somsoms.tikitaka.domain.*;

public class MatchingService {
	
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

	List<Matching> getMatchingResults(int userId) {
        return null;}
	  // findAllResultByUserId로 매칭 전체 결과 받아오기

	void deleteMatchingResult() {}
	  // MatchingResult의 모든 유저의 요청 시간과 현재 시간을 비교
	  // 24시간이 지났다면 delete
	  // @Scheduled annotation으로 특정 시간마다 지속적으로 실행 *
	
}