package com.somsoms.tikitaka.controller;

import com.somsoms.tikitaka.domain.*;
import org.springframework.http.ResponseEntity;

public class UserController {
	private UserService userService;

    public ResponseEntity<String> registerUser(@RequestBody UserCommand userCommand);
    
    public ResponseEntity<String> loginUser(@RequestParam String email, @RequestParam String password);
    
    public ResponseEntity<User> getUserInfo(@PathVariable Long userId);
    
    public ResponseEntity<String> updateUser(@RequestBody UserCommand userCommand);
    
    public ResponseEntity<String> deleteUser(@PathVariable Long userId);

}