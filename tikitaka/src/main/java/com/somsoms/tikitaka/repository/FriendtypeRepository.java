package com.somsoms.tikitaka.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.somsoms.tikitaka.domain.Friendtype;
import com.somsoms.tikitaka.domain.Idealtype;

@Repository
public interface FriendtypeRepository extends JpaRepository<Friendtype, Integer> {
	 Friendtype findByUser_UserId(int userId); // UserController에서 사용한 메서드
}
