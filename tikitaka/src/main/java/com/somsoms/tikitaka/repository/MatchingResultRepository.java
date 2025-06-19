package com.somsoms.tikitaka.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.somsoms.tikitaka.domain.MatchingResult;

public interface MatchingResultRepository extends JpaRepository<MatchingResult, Integer> {
    MatchingResult findByUserUserIdAndRequestType(int userId, String type);
    
    @Modifying
    @Transactional
    @Query(value = """
        DELETE FROM MATCHINGRESULT 
        WHERE TRUNC(REQUEST_TIME) != TRUNC(SYSDATE)
        """, nativeQuery = true)
    int deleteNotToday();
}
