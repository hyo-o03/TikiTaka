package com.somsoms.tikitaka.dao;

import com.somsoms.tikitaka.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface UserDao extends JpaRepository<User, Integer> {

//    static void insertUser(User user) {
//    }
//    
//    User findUserByEmailAndPassword(String email, String password) {
//        return null;
//    }
//    
//    User findUserById(Long id) {
//        return null;
//    }
//    
//    void updateUser(User user) {
//    }
//    
//    void deleteUser(Long id) {
//    }
    Optional<User> findByEmailAndPassword(String email, String password);
    // findById, save, deleteById 등은 상속만으로 자동 제공됨
}
