package com.somsoms.tikitaka.service;

import com.somsoms.tikitaka.domain.*;

public class FriendtypeService {
	
    Friendtype getFriendtype(Long userId);
    
    void updateFriendtype(FriendtypeCommand friendtypeCommand);
    
}
