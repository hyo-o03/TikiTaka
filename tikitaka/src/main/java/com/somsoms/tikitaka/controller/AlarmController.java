package com.somsoms.tikitaka.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.somsoms.tikitaka.domain.*;
import com.somsoms.tikitaka.repository.*;

@Controller
@RequestMapping("/alarm")
public class AlarmController {
    @Autowired
    private AlarmRepository alarmRepository;

    @GetMapping("/markAsRead")
    @ResponseBody
    public String markAlarmAsRead(@RequestParam("alarmId") int alarmId) {
        Alarm alarm = alarmRepository.findById(alarmId).orElseThrow();
        alarm.setIsChecked("Y");
        alarmRepository.save(alarm);
        return "OK";
    }
}
