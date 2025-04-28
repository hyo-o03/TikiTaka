package com.somsoms.tikitaka.dao;

import java.util.List;
import com.somsoms.tikitaka.domain.*;

public class MatchingDao {

	void insertMatching

	void updateMatchStatus(int matchId, String status, Datetime respond_time)
	//매칭 수락, 거절 상태 업데이트

	Matching findResultByMatchId(int match_id)
	//매칭 결과 하나 가져오기

	List<Matching> findAllResultByUserId(int user_id)
	//유저별 매칭 결과 모두 가져오기
	
}
