package com.somsoms.tikitaka.config;

import com.somsoms.tikitaka.domain.User;
import com.somsoms.tikitaka.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class GlobalUserControllerAdvice {

    @Autowired
    private UserRepository userRepository;

    @ModelAttribute("loginUser")
    public User setUserInModel(HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        System.out.println("로그인된 사용자: " + userId);
        if (userId != null) {
            return userRepository.findById(userId).orElse(null);
        }
        return null;
    }
}
