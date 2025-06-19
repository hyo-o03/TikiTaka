package com.somsoms.tikitaka.service;

import org.springframework.stereotype.Service;
import com.somsoms.tikitaka.dao.IdealtypeDao;
import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.repository.IdealtypeRepository;

@Service
public class IdealtypeService {
	
	private final IdealtypeRepository idealtypeRepository;

    public IdealtypeService(IdealtypeRepository idealtypeRepository) {
        this.idealtypeRepository = idealtypeRepository;
    }
    
    // ✅ 사용자 ID로 이상형 정보 가져오기
    public Idealtype getIdealtypeByUserId(int userId) {
        return idealtypeRepository.findByUser_UserId(userId);
    }

    // ✅ 이상형 정보 저장 (등록/수정 모두)
    public void updateIdealtype(Idealtype idealtype) {
        idealtypeRepository.save(idealtype); // 영속 상태이면 update
    }

    // ✅ 삭제가 필요할 경우 (실제 사용 가능)
    public void deleteIdealtype(int id) {
        idealtypeRepository.deleteById(id);
    }

}
