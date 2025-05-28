package com.somsoms.tikitaka.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.somsoms.tikitaka.domain.Idealtype;

@Repository
public interface IdealtypeRepository extends JpaRepository<Idealtype, Integer> {
}
