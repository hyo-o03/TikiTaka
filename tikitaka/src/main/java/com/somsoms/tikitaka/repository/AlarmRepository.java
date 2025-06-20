package com.somsoms.tikitaka.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.somsoms.tikitaka.domain.Alarm;

@Repository
public interface AlarmRepository extends JpaRepository<Alarm, Integer>{
	List<Alarm> findByReceiver_UserId(int userId);
}
