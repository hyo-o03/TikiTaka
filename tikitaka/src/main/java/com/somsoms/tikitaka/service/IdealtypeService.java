package com.somsoms.tikitaka.service;

import com.somsoms.tikitaka.domain.*;

public class IdealtypeService {
	
    Idealtype getIdealtype(Long userId);
    
    void updateIdealtype(IdealtypeCommand idealtypeCommand);
    
}
