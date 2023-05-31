package com.earthball.member.challenge.controller;

import com.earthball.admin.challenge.dto.CategoryDto;
import com.earthball.admin.challenge.dto.CategoryTemplateDto;
import com.earthball.admin.challenge.dto.CodeDto;
import com.earthball.admin.challenge.service.CategoryService;
import com.earthball.admin.challenge.service.CategoryTemplateService;
import com.earthball.admin.challenge.service.CodeService;
import com.earthball.member.challenge.dto.ChallengeDto;
import com.earthball.member.challenge.service.ChallengeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.core.util.datetime.DatePrinter;
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

    List<CategoryTemplateDto> templateList = templateService.selectTemplateList(categoryNo);

    log.info("서비스다 다녀온 templateList : " + templateList);

    for (int i = 0; i < templateList.size(); i++) {
      log.info("grp넘어왔어? : " + templateList.get(i).getGrpCode());
      if (StringUtils.isNotEmpty(templateList.get(i).getGrpCode())) {
        List<CodeDto> codeDtoList = codeService.selectCodeList(templateList.get(i).getGrpCode());
        templateList.get(i).setCodeDtoList(codeDtoList);
      }
    }

    CategoryDto categoryDto = categoryService.selectCategory(categoryNo);

    model.addAttribute("category", categoryDto);
    model.addAttribute("templateList", templateList);

    log.info("templateList : " + templateList);
    log.info("templateList 0번째 코드리스트: " + templateList.get(0).getCodeDtoList());

    return "member/challenge/challenge/challengeInsertForm";
  }

  @ResponseBody
  @PostMapping("/openRequest.chall")
  public int requestChallenge(ChallengeDto challengeDto) {

    String inputDate_1 = challengeDto.getChStartDay();  //"2023-05-30"
    String inputDate_2 = challengeDto.getChEndDay();

    LocalDate date = LocalDate.parse(inputDate_1);
    String chStarDay = date.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
    String chEndDay = date.format(DateTimeFormatter.ofPattern("yyyyMMdd"));

    log.info("시작 날짜 : " + chStarDay);
    log.info("종료 날짜 : " + chEndDay);

    challengeDto.setChStartDay(chStarDay);
    challengeDto.setChEndDay(chEndDay);

    int result = challengeService.requestChallenge(challengeDto);

    return result;
  }


}
