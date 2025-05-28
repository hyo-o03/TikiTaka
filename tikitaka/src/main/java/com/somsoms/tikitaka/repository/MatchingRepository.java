package com.somsoms.tikitaka.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.somsoms.tikitaka.domain.Matching;
import com.somsoms.tikitaka.domain.User;
import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;

@Repository
public interface MatchingRepository extends JpaRepository<Matching, Integer> {
    List<Matching> findByUser_UserId(int userId);
    
}
