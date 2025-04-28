package com.somsoms.tikitaka.controller;

import com.somsoms.tikitaka.domain.*;
import org.springframework.http.ResponseEntity;

public class FriendtypeController {
	
	private FriendtypeService friendtypeService;

    public ResponseEntity<Friendtype> getFriendtype(@PathVariable Long userId);
    
    public ResponseEntity<String> updateFriendtype(@RequestBody FriendtypeCommand friendtypeCommand);

}
