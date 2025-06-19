package com.somsoms.tikitaka.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.somsoms.tikitaka.domain.Matching;
import com.somsoms.tikitaka.domain.MatchingResult;

public interface MatchingResultRepository extends JpaRepository<MatchingResult, Integer> {
    MatchingResult findByUserUserIdAndRequestType(int userId, String type);
    @Query("SELECT m.resultId FROM MatchingResult m WHERE m.user.userId = :userId AND m.requestType = :requestType")
    List<Integer> findResultIdsByUserIdAndRequestType(@Param("userId") int userId, @Param("requestType") String requestType);
    
    @Modifying
    @Transactional
    @Query(value = """
        DELETE FROM MATCHINGRESULT 
        WHERE TRUNC(REQUEST_TIME) != TRUNC(SYSDATE)
        """, nativeQuery = true)
    int deleteNotToday();
}
