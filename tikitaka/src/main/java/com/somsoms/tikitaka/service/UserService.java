package com.somsoms.tikitaka.service;

import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.dao.UserDao;
import com.somsoms.tikitaka.domain.User;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {
    private final UserDao userDao;

    public UserService(UserDao userDao) {
        this.userDao = userDao;
    }

    public User login(String email, String password) {
        // 이메일 + 비밀번호로 사용자 조회
        return userDao.findByEmailAndPassword(email, password).orElse(null);
    }

    public User getUserById(int id) {
        return userDao.findById(id).orElse(null);
    }

    public void updateUser(User user) {
        userDao.save(user); // JPA save: insert or update 자동 수행
    }

    public void deleteUser(int id) {
        userDao.deleteById(id);
    }
    
    void registerUser(UserDao userCommand) {
	}
}
