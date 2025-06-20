package com.somsoms.tikitaka.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.somsoms.tikitaka.domain.Alarm;

@Repository
public interface AlarmRepository extends JpaRepository<Alarm, Integer>{
	List<Alarm> findByReceiver_UserId(int userId);
	
    @Modifying
    @Transactional
    @Query("DELETE FROM Alarm a WHERE a.sender.id = :userId")
    void deleteBySenderId(@Param("userId") int userId);

    @Modifying
    @Transactional
    @Query("DELETE FROM Alarm a WHERE a.receiver.id = :userId")
    void deleteByReceiverId(@Param("userId") int userId);
}
