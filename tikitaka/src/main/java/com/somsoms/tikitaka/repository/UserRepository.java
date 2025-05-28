package com.somsoms.tikitaka.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.somsoms.tikitaka.domain.User;

public interface UserRepository extends JpaRepository<User, Integer> {
}
