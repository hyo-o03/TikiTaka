package com.somsoms.tikitaka.repository;


import com.somsoms.tikitaka.domain.User;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    // 필요한 경우 커스텀 메서드 작성 가능

	@Query(value = "SELECT * FROM USERINFO WHERE ID != :requesterId ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 3 ROWS ONLY", nativeQuery = true)
	List<User> findMatchingUser(@Param("requesterId") int requesterId);
}
