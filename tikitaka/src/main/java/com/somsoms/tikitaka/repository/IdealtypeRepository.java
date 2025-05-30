package com.somsoms.tikitaka.repository;

import com.somsoms.tikitaka.domain.Idealtype;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IdealtypeRepository extends JpaRepository<Idealtype, Integer> {

    Idealtype findByUser_UserId(int userId); // UserController에서 사용한 메서드
}
