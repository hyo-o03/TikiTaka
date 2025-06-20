package com.somsoms.tikitaka.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.somsoms.tikitaka.domain.Friendtype;

@Repository
public interface FriendtypeRepository extends JpaRepository<Friendtype, Integer> {
	 Friendtype findByUser_UserId(int userId); // UserController에서 사용한 메서드
	 
	 @Modifying
	 @Transactional
	 @Query("DELETE FROM Friendtype f WHERE f.user.id = :userId")
	 void deleteByUserId(@Param("userId") int userId);
}
