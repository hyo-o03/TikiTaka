package com.somsoms.tikitaka.controller;

import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.service.FriendtypeService;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

public class FriendtypeController {
	
	private FriendtypeService friendtypeService;

    public ResponseEntity<Friendtype> getFriendtype(@PathVariable Long userId) {
        return null;
    }
    
    public ResponseEntity<String> updateFriendtype(@RequestBody Friendtype friendtypeCommand) {
        return null;
    }

}
