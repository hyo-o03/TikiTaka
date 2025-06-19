package com.somsoms.tikitaka.service;

import org.springframework.stereotype.Service;
import com.somsoms.tikitaka.dao.FriendtypeDao;
import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.repository.FriendtypeRepository;
import com.somsoms.tikitaka.repository.IdealtypeRepository;

@Service
public class FriendtypeService {
	    
    private final FriendtypeRepository friendypeRepository;

    public FriendtypeService(FriendtypeRepository friendypeRepository) {
        this.friendypeRepository = friendypeRepository;
    }
    
    // ✅ 사용자 ID로 동성친구 정보 가져오기
    public Friendtype getFriendtypeByUserId(int userId) {
        return friendypeRepository.findByUser_UserId(userId);
    }

    // ✅ 동성친구 정보 저장 (등록/수정 모두)
    public void updateFriendtype(Friendtype friendtype) {
    	friendypeRepository.save(friendtype); // 영속 상태이면 update
    }

    // ✅ 삭제가 필요할 경우 (실제 사용 가능)
    public void deleteFriendtype(int id) {
    	friendypeRepository.deleteById(id);
    }

}
