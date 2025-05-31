package com.somsoms.tikitaka.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.somsoms.tikitaka.domain.Friendtype;

@Repository
public interface FriendtypeRepository extends JpaRepository<Friendtype, Integer> {
}
