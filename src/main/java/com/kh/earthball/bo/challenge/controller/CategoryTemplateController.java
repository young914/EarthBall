package com.kh.earthball.bo.challenge.controller;

import com.kh.earthball.bo.challenge.service.CategoryService;
import com.kh.earthball.bo.challenge.service.CategoryTemplateService;
import com.kh.earthball.bo.challenge.service.CodeService;
import com.kh.earthball.bo.challenge.vo.Category;
import com.kh.earthball.bo.challenge.vo.CategoryTemplate;
import com.kh.earthball.bo.challenge.vo.Code;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class CategoryTemplateController {

  private final CategoryService categoryService;
  private final CategoryTemplateService templateService;
  private final CodeService codeService;

  @GetMapping("insertForm.te")
  public String insertTemplateForm(@RequestParam(value = "categoryNo") int categoryNo, Model model) {

    Category category = categoryService.selectCategory(categoryNo);

    model.addAttribute("category", category);
    model.addAttribute("grpCodeList", codeService.selectListAll());

    return "bo/challenge/categoryTemplate/templateEnrollForm";
  }

  @ResponseBody
  @PostMapping("insert.te")
  public int insertTemplate(CategoryTemplate template) {
    return templateService.insertTemplate(template);
  }

  @GetMapping("insertForm.ch")
  public String insertChallengeForm(@RequestParam(value = "categoryNo") int categoryNo, Model model) {

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

    return "bo/challenge/categoryTemplate/challengeInsertForm";
  }
}
