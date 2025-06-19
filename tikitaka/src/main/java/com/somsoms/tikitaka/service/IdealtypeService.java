package com.somsoms.tikitaka.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.somsoms.tikitaka.dao.IdealtypeDao;
import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.repository.IdealtypeRepository;

@Service
public class IdealtypeService {
    @Autowired
    private IdealtypeRepository idealtypeRepository;
	
    Idealtype getIdealtype(Long userId) {
        return null;
    }
    
    void updateIdealtype(Idealtype idealtypeCommand) {
	}
    
    public void processMatching(int userId, String priority1, String priority2, String priority3) {
        Idealtype idealtype =idealtypeRepository.findByUser_UserId(userId);

        String value1 = extractValueByPriority(idealtype, priority1);
        String value2 = extractValueByPriority(idealtype, priority2);
        String value3 = extractValueByPriority(idealtype, priority3);


        // 예시: 출력
        System.out.println("1순위 : " + priority1);
        System.out.println("2순위 : " + priority2);
        System.out.println("3순위 : " + priority3);
        
        // 여기서 이 값들을 기반으로 매칭 처리 수행
        // (예: 다른 유저랑 비교, 매칭 알고리즘 적용 등)


    }
    
    private String extractValueByPriority(Idealtype ideal, String priority) {
        switch (priority) {
            case "나이": return String.valueOf(ideal.getItAge());
            case "키": return String.valueOf(ideal.getItHeight());
            case "거주지": return ideal.getItAddress();
            case "관심사": return ideal.getItHobby();
            case "MBTI": return ideal.getItMbti();
            case "흡연유무": return ideal.isItSmoke();
            case "종교": return ideal.getItFacialtype();
            default: return "";
        }
    }

}
