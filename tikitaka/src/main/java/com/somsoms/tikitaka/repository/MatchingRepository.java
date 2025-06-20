package com.somsoms.tikitaka.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.somsoms.tikitaka.domain.Matching;
import com.somsoms.tikitaka.domain.User;
import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
import java.util.Optional;

@Repository
public interface MatchingRepository extends JpaRepository<Matching, Integer> {
    List<Matching> findByUser_UserId(int userId);

    List<Matching> findByMatchingResultResultId(int matchingResultId);
    
    List<Matching> findByMatchingResult_ResultIdIn(List<Integer> resultIds);
    
    Optional<Matching> findByUser_UserIdAndMatchedUserId(int userId, int matchedUserId);
    
    @Modifying
    @Transactional
    @Query("""
        UPDATE Matching m
        SET m.status = 'ACCEPTED'
        WHERE m.matchedUserId = :matchedUserId
    """)
    int acceptMatching(@Param("matchedUserId") int matchedUserId);
    
    @Modifying
    @Transactional
    @Query(value = """
        DELETE FROM MATCHING 
        WHERE RESULT_ID IN (
            SELECT RESULT_ID FROM MATCHINGRESULT 
            WHERE TRUNC(REQUEST_TIME) != TRUNC(SYSDATE)
        )
        """, nativeQuery = true)
    int deleteNotToday();
}
