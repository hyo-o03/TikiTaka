package com.somsoms.tikitaka.dao;

import java.sql.Date;
import java.util.List;
import com.somsoms.tikitaka.domain.*;

public class MatchingDao {

	void insertMatching() {
    }

	void updateMatchStatus(int matchId, String status, Date respondTime) {
    }
	//매칭 수락, 거절 상태 업데이트

	Matching findResultByMatchId(int matchId) {
        return null;
    }
	//매칭 결과 하나 가져오기
	//이 결과로 매칭된 유저 프로필도 가져올 수 있음

	List<Matching> findAllResultByUserId(int userId) {
        return null;
    }
	//유저별 매칭 결과 모두 가져오기
}
