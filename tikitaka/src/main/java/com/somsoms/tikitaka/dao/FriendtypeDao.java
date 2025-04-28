package com.somsoms.tikitaka.dao;

import com.somsoms.tikitaka.domain.*;

public class FriendtypeDao {
	
    void insertFriendtype(Friendtype friendtype);
    
    Friendtype findFriendtypeByUserId(Long userId);
	/* Friendtype findFtypeByUserId(int user_id) */
    
    void updateFriendtype(Friendtype friendtype);
    
    void deleteFriendtype(Long userId);
	
}
