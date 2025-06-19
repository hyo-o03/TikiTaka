package com.somsoms.tikitaka.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.somsoms.tikitaka.domain.Friendtype;
import com.somsoms.tikitaka.domain.Matching;

@Repository
public interface FriendtypeRepository extends JpaRepository<Friendtype, Integer> {


}
