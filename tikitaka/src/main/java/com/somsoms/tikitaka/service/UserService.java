package com.somsoms.tikitaka.service;

import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.dao.UserDao;
import com.somsoms.tikitaka.domain.User;
import com.somsoms.tikitaka.repository.FriendtypeRepository;
import com.somsoms.tikitaka.repository.IdealtypeRepository;
import com.somsoms.tikitaka.repository.MatchingRepository;
import com.somsoms.tikitaka.repository.MatchingresultRepository;
import com.somsoms.tikitaka.repository.UserRepository;

import jakarta.transaction.Transactional;

import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {
    private final UserDao userDao;
    private final UserRepository userRepository;
    //private final AlarmRepository alarmRepository;
    private final FriendtypeRepository friendTypeRepository;
    private final IdealtypeRepository idealtypeRepository;
    private final MatchingRepository matchingRepository;
    private final MatchingresultRepository matchingResultRepository;

    public UserService(UserDao userDao,
    		UserRepository userRepository,
            //AlarmRepository alarmRepository,
            FriendtypeRepository friendTypeRepository,
            IdealtypeRepository idealtypeRepository,
            MatchingRepository matchingRepository,
            MatchingresultRepository matchingResultRepository) {
        this.userDao = userDao;
        this.userRepository = userRepository;
        //this.alarmRepository = alarmRepository;
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
    
    /*
    @Transactional
	public void deleteById(int userId) {
		// TODO Auto-generated method stub
    	 // 1. 알림 (보낸 것, 받은 것)
        alarmRepository.deleteBySenderId(userId);
        alarmRepository.deleteByReceiverId(userId);

        // 2. 친구
        friendTypeRepository.deleteByUserId(userId);

        // 3. 이상형
        idealtypeRepository.deleteByUserId(userId);

        // 4. 매칭 결과
        matchingResultRepository.deleteByUserId(userId);

        // 5. 매칭 - 내가 매칭한 것도, 매칭당한 것도
        matchingRepository.deleteByUserIdOrMatchedUserId(userId, userId);

        // 6. 마지막으로 유저
        userRepository.deleteById(userId);
	}
	*/
}
