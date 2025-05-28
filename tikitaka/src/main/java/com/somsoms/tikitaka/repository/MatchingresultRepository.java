package com.somsoms.tikitaka.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.somsoms.tikitaka.domain.MatchingResult;

public interface MatchingresultRepository extends JpaRepository<MatchingResult, Integer> {
}
