package com.somsoms.tikitaka.service;

import com.somsoms.tikitaka.domain.*;

public class UserService {
    void registerUser(UserCommand userCommand);
    
    String loginUser(String email, String password);
    
    User getUserInfo(Long userId);
    
    void updateUser(UserCommand userCommand);
    
    void deleteUser(Long userId);
}
