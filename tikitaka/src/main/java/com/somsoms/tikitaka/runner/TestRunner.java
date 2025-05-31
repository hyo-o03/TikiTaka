package com.somsoms.tikitaka.runner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import com.somsoms.tikitaka.domain.User;
import com.somsoms.tikitaka.repository.UserRepository;

@Component
public class TestRunner implements CommandLineRunner {

    @Autowired
    private UserRepository userRepository;

    @Override
    public void run(String... args) {
   



        // 데이터 조회
        System.out.println("🔍 전체 유저 수: " + userRepository.count());
        userRepository.findAll().forEach(u -> {
            System.out.println("✔️ 유저 이름: " + u.getUserId());
        });
    }
}
