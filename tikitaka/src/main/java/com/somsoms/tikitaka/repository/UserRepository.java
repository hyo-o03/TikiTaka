package com.somsoms.tikitaka.repository;

import com.somsoms.tikitaka.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    // 필요한 경우 커스텀 메서드 작성 가능
}
