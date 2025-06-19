package com.somsoms.tikitaka.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
    @GetMapping("/agree")
    public String agreePage() { return "agreePage"; }

    @GetMapping("/application-complete")
    public String applicationComplete() { return "applicationComplete"; }

    @GetMapping("/base-info")
    public String baseInfoPage() { return "baseInfoPage"; }

    @GetMapping("/certification")
    public String certificationPage() { return "certificationPage"; }

    @GetMapping("/default-setting")
    public String defaultSetting() { return "defaultPageSetting"; }

    @GetMapping("/edit-address")
    public String editAddress() { return "editAddress"; }

    @GetMapping("/edit-hobby")
    public String editHobby() { return "editHobby"; }

    @GetMapping("/edit-mbti")
    public String editMbti() { return "editMbti"; }

    @GetMapping("/edit-my-profile")
    public String editMyProfile() { return "editMyProfile"; }

    @GetMapping("/edit-profile")
    public String editProfile() { return "editProfile"; }

    @GetMapping("/finish")
    public String finishPage() { return "finishPage"; }

    @GetMapping("/home")
    public String home() { return "home"; }

    @GetMapping("/ideal-type-choice")
    public String idealTypeChoice() { return "idealTypeChoice"; }

    @GetMapping("/ideal-type-info")
    public String idealTypeInfo() { return "idealTypeInfo"; }

    @GetMapping("/ideal-ranking")
    public String idealRanking() { return "idealTypeLanking"; }

    @GetMapping("/matching-result")
    public String matchingResult() { return "matchingResultPage"; }

    @GetMapping("/mypage")
    public String myPage() { return "myPage"; }

    @GetMapping("/register")
    public String registerPage() { return "registerPage"; }

    @GetMapping("/select-address")
    public String selectAddress() { return "selectAddress"; }

    @GetMapping("/select-hobby")
    public String selectHobby() { return "selectHobby"; }

    @GetMapping("/select-mbti")
    public String selectMbti() { return "selectMbti"; }

    @GetMapping("/select-profile")
    public String selectProfile() { return "selectProfile"; }

    @GetMapping("/start")
    public String startingPage() { return "start"; }
}
