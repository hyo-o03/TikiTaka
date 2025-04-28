package com.somsoms.tikitaka.dao;

import com.somsoms.tikitaka.domain.*;

public class IdealtypeDao {

    void insertIdealtype(Idealtype idealtype);
	
    Idealtype findIdealtypeByUserId(Long userId);
	/* Idealtype findItypeByUserId(int user_id) */
    
    void updateIdealtype(Idealtype idealtype);
    
    void deleteIdealtype(Long userId);
    
}
