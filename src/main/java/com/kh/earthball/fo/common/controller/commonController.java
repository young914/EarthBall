package com.kh.earthball.fo.common.controller;

import com.kh.earthball.fo.challenge.service.ChallengeService;
import com.kh.earthball.fo.challenge.vo.Challenge;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class commonController {

  private final ChallengeService challengeService;

  @RequestMapping("/main")
  public String home(Model model) {
    // 챌린지 최근 3건 조회
    List<Challenge> challengeList = challengeService.mainChallengeList();

    log.info("최근 3건 챌린지 넘어왔니? : " + challengeList);

    model.addAttribute("challengeList", challengeList);
    return "fo/common/main";
  }


/*
  @GetMapping("/")
  public String main(Model model) {
    // 챌린지 최근 3건 조회
    List<Challenge> challengeList = challengeService.mainChallengeList();

    log.info("최근 3건 챌린지 넘어왔니? : " + challengeList);

    model.addAttribute("challengeList", challengeList);
    return "fo/common/main";
  }

 */
}
