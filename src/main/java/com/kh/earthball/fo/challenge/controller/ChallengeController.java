package com.kh.earthball.fo.challenge.controller;

import com.kh.earthball.bo.challenge.service.CategoryService;
import com.kh.earthball.bo.challenge.service.CategoryTemplateService;
import com.kh.earthball.bo.challenge.service.CodeService;
import com.kh.earthball.bo.challenge.vo.Category;
import com.kh.earthball.bo.challenge.vo.CategoryTemplate;
import com.kh.earthball.bo.challenge.vo.Code;
import com.kh.earthball.fo.challenge.service.ChallengeService;
import com.kh.earthball.fo.challenge.vo.Challenge;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
  public String challengeMain(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {

    // 전체 챌린지 게시글 수 조회
    int listCount = challengeService.selectListCount();

    int pageLimit = 5;
    int boardLimit = 12;

    PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    ArrayList<Challenge> challengeList = challengeService.selectList(pageInfo);

    List<Category> categoryList = categoryService.selectCategoryList();

    model.addAttribute("pageInfo", pageInfo);
    model.addAttribute("challengeList", challengeList);
    model.addAttribute("categoryList", categoryList);

    return "fo/challenge/challengeMain";
  }


  @GetMapping("/categoryList.chall")
  public String categoryChoice_chall() {
    return "fo/challenge/challenge/challengeCategoryChoice";
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

    return "fo/challenge/challenge/challengeInsertForm";
  }

  @ResponseBody
  @PostMapping("/openRequest.chall")
  public int requestChallenge(@RequestBody Challenge challenge) {

    int result = challengeService.requestChallenge(challenge);

    return result;
  }

  @GetMapping("confirmForm.chall")
  public String confirmInsertForm() {
    return "fo/challenge/confirm/confirmInsertForm";
  }


  @GetMapping("/detailView.chall")
  public String challengeDetailView(int chNo, Model model) {

    // 챌린지 게시글 하나 조회
    Challenge challenge = challengeService.selectChallenge(chNo);

    model.addAttribute("challenge", challenge);

    return "fo/challenge/challenge/challengeDetailView";
  }
}
