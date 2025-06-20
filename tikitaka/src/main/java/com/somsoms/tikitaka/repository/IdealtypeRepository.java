package com.somsoms.tikitaka.repository;

import com.somsoms.tikitaka.domain.Idealtype;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface IdealtypeRepository extends JpaRepository<Idealtype, Integer> {

    Idealtype findByUser_UserId(int userId);

    @Modifying
    @Transactional
    @Query("DELETE FROM Idealtype i WHERE i.user.id = :userId")
    void deleteByUserId(@Param("userId") int userId);
}
