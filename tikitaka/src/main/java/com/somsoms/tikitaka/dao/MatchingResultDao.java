package com.somsoms.tikitaka.dao;

import java.util.Date;
import com.somsoms.tikitaka.domain.*;

public class MatchingResultDao {

	void insertMatchResult

	void deleteMatchResult(int result_id, Datetime request_time)
	//24시간 주기로 매칭 결과 정보 삭제(ON DELETE CASCADE)

	Date findRequestTimeByUserId(int user_id)
	//유저별 매칭 시간 가져오기

}
