package com.somsoms.tikitaka.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class AlarmController {

    @GetMapping("/alarm")
    public String showAlarm(Model model) {
        List<String> alarms = List.of(
            "오늘의 이상형 추천이 도착했습니다!",
            "새로운 매칭 상대가 있어요!"
        );
        model.addAttribute("alarms", alarms);
        return "home"; // or "alarmPage" 등 jsp 이름
    }
}
