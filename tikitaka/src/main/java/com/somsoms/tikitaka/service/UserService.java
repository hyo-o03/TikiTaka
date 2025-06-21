package com.somsoms.tikitaka.service;

import org.springframework.stereotype.Service;

import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.dao.UserDao;
import com.somsoms.tikitaka.domain.User;
import com.somsoms.tikitaka.repository.*;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

import org.springframework.stereotype.Service;
import java.util.Optional;

@Service
public class UserService {
    private final UserDao userDao;
    private final UserRepository userRepository;
    private final AlarmRepository alarmRepository;
    private final FriendtypeRepository friendTypeRepository;
    private final IdealtypeRepository idealtypeRepository;
    private final MatchingRepository matchingRepository;
    private final MatchingResultRepository matchingResultRepository;

    @PersistenceContext
    private EntityManager em;

    public UserService(UserDao userDao,
    		UserRepository userRepository,
            AlarmRepository alarmRepository,
            FriendtypeRepository friendTypeRepository,
            IdealtypeRepository idealtypeRepository,
            MatchingRepository matchingRepository,
            MatchingResultRepository matchingResultRepository) {
        this.userDao = userDao;
        this.userRepository = userRepository;
        this.alarmRepository = alarmRepository;
        this.friendTypeRepository = friendTypeRepository;
        this.idealtypeRepository = idealtypeRepository;
        this.matchingRepository = matchingRepository;
        this.matchingResultRepository = matchingResultRepository;
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
    
    void registerUser(UserDao userCommand) {
	}
    
    public boolean updatePassword(int userId, String currentPassword, String newPassword) {
        User user = getUserById(userId);
        if (user == null) {
            return false;
        }
        
        // 현재 비밀번호 확인
        if (!currentPassword.equals(user.getPassword())) {
            return false;
        }
        
        // 새 비밀번호로 업데이트
        user.setPassword(newPassword);
        updateUser(user);
        return true;
    }
    
    @Transactional
	public void deleteById(int userId) {
		// TODO Auto-generated method stub
    	alarmRepository.deleteBySenderId(userId);       // 1
    	alarmRepository.deleteByReceiverId(userId);     // 2

    	matchingRepository.deleteByUserIdOrMatchedUserId(userId); // 3

    	matchingResultRepository.deleteByUserId(userId); // 4

    	friendTypeRepository.deleteByUserId(userId);    // 5

    	idealtypeRepository.deleteByUserId(userId);     // 6
    	
        // 🔥 삭제 후 영속성 컨텍스트 초기화
        idealtypeRepository.deleteByUserId(userId);
        em.flush();     // 즉시 반영
        em.clear();     // ⛔ 중복 delete 방지

    	userRepository.deleteById(userId);              // 7
	}
}
