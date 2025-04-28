package com.somsoms.tikitaka.dao;

import com.somsoms.tikitaka.domain.*;

public class UserDao {
	
    void insertUser(User user);
    
    User findUserByEmailAndPassword(String email, String password);
    
    User findUserById(Long id);
    
    void updateUser(User user);
    
    void deleteUser(Long id);
    
}
