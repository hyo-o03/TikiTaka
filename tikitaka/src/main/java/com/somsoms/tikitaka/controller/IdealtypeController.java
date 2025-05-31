package com.somsoms.tikitaka.controller;

import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.service.IdealtypeService;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

public class IdealtypeController {
	
    private IdealtypeService idealtypeService;

    public ResponseEntity<Idealtype> getIdealtype(@PathVariable Long userId) {
        return null;
    }
    
    public ResponseEntity<String> updateIdealtype(@RequestBody Idealtype idealtypeCommand) {
        return null;
    }

}
