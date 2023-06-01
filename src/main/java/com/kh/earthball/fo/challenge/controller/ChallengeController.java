package com.kh.earthball.fo.challenge.controller;

import com.kh.earthball.bo.challenge.service.CategoryService;
import com.kh.earthball.bo.challenge.service.CategoryTemplateService;
import com.kh.earthball.bo.challenge.service.CodeService;
import com.kh.earthball.bo.challenge.vo.Category;
import com.kh.earthball.bo.challenge.vo.CategoryTemplate;
import com.kh.earthball.bo.challenge.vo.Code;
import com.kh.earthball.fo.challenge.service.ChallengeService;
import com.kh.earthball.fo.challenge.vo.Challenge;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ChallengeController {

  private final CategoryService categoryService;
  private final CategoryTemplateService templateService;
  private final CodeService codeService;
  private final ChallengeService challengeService;

  @GetMapping("/main.chall")
  public String challengeMain() {
    return "/member/challenge/challengeMain";
  }


  @GetMapping("/categoryList.chall")
  public String categoryChoice_chall() {
    return "/member/challenge/challenge/challengeCategoryChoice";
  }


  @GetMapping("/openForm.chall")
  public String openChallengeForm(@RequestParam(value = "categoryNo") int categoryNo, Model model) {

    List<CategoryTemplate> templateList = templateService.selectTemplateList(categoryNo);

    log.info("서비스다 다녀온 templateList : " + templateList);

    for (int i = 0; i < templateList.size(); i++) {
      log.info("grp넘어왔어? : " + templateList.get(i).getGrpCode());
      if (StringUtils.isNotEmpty(templateList.get(i).getGrpCode())) {
        List<Code> codeList = codeService.selectCodeList(templateList.get(i).getGrpCode());
        templateList.get(i).setCodeList(codeList);
      }
    }

    Category category = categoryService.selectCategory(categoryNo);

    model.addAttribute("category", category);
    model.addAttribute("templateList", templateList);

    log.info("templateList : " + templateList);
    log.info("templateList 0번째 코드리스트: " + templateList.get(0).getCodeList());

    return "member/challenge/challenge/challengeInsertForm";
  }

  @ResponseBody
  @PostMapping("/openRequest.chall")
  public int requestChallenge(Challenge challenge) {

    String inputDate_1 = challenge.getChStartDay();  //"2023-05-30"
    String inputDate_2 = challenge.getChEndDay();

    LocalDate date = LocalDate.parse(inputDate_1);
    String chStarDay = date.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
    String chEndDay = date.format(DateTimeFormatter.ofPattern("yyyyMMdd"));

    log.info("시작 날짜 : " + chStarDay);
    log.info("종료 날짜 : " + chEndDay);

    challenge.setChStartDay(chStarDay);
    challenge.setChEndDay(chEndDay);

    int result = challengeService.requestChallenge(challenge);

    return result;
  }


}