package com.somsoms.tikitaka.controller;

import com.somsoms.tikitaka.domain.*;
import org.springframework.http.ResponseEntity;

public class IdealtypeController {
	
    private IdealtypeService idealtypeService;

    public ResponseEntity<Idealtype> getIdealtype(@PathVariable Long userId);
    
    public ResponseEntity<String> updateIdealtype(@RequestBody IdealtypeCommand idealtypeCommand);

}
