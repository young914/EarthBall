package com.kh.earthball.fo.challenge.controller;

import com.kh.earthball.bo.challenge.controller.CategoryTemplateController;
import com.kh.earthball.bo.challenge.service.CategoryService;
import com.kh.earthball.bo.challenge.service.CategoryTemplateService;
import com.kh.earthball.bo.challenge.service.CodeService;
import com.kh.earthball.bo.challenge.vo.Category;
import com.kh.earthball.bo.challenge.vo.CategoryTemplate;
import com.kh.earthball.bo.challenge.vo.Code;
import com.kh.earthball.fo.challenge.service.ChallengeService;
import com.kh.earthball.fo.challenge.service.ConfirmService;
import com.kh.earthball.fo.challenge.vo.ChConfirm;
import com.kh.earthball.fo.challenge.vo.ChDetailInfo;
import com.kh.earthball.fo.challenge.vo.Challenge;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ConfirmController {

  private final ConfirmService confirmService;
  private final ChallengeService challengeService;
  private final CategoryTemplateService templateService;
  private final CategoryService categoryService;
  private final CodeService codeService;


  @GetMapping("/insertForm.con")
  public String confirmInsertForm(@RequestParam(value="chNo") int chNo, Model model) {

    // 해당 챌린지의 정보 가져오기
    Challenge challenge = challengeService.selectChallenge(chNo);

    log.info("어떤 챌린지인지 조회됨? : " + challenge);

    int categoryNo = challenge.getCategoryNo();

    log.info("카테고리 번호 나와 : " + categoryNo);

    // 해당 챌린지의 카테고리번호를 가지고 인증 폼 가져오기
    List<CategoryTemplate> templateList = templateService.selectTemplateList(challenge.getCategoryNo());

    for (int i = 0; i < templateList.size(); i++) {
      log.info("grp넘어왔어? : " + templateList.get(i).getGrpCode());
      if (StringUtils.isNotEmpty(templateList.get(i).getGrpCode())) {
        List<Code> codeList = codeService.selectCodeList(templateList.get(i).getGrpCode());
        templateList.get(i).setCodeList(codeList);
      }
    }

    Category category = categoryService.selectCategory(challenge.getCategoryNo());

    model.addAttribute("category", category);
    model.addAttribute("templateList", templateList);
    model.addAttribute("challenge", challenge);

    return "fo/challenge/confirm/confirmInsertForm";
  }

  @ResponseBody
  @PostMapping("insert.con")
  public int confirmInsert(@RequestBody ChConfirm chConfirm) {

    int result1 = confirmService.insertConfirm(chConfirm);
    log.info("챌린지 인증 일련번호 : " + chConfirm.getChConNo());
    int chConNo = chConfirm.getChConNo();
    int chNo = chConfirm.getChNo();

    List<ChDetailInfo> chDetailInfoList = chConfirm.getChDetailInfoList();
    if(result1 > 0) { // 기본정보 등록 성공이면 디테일 내용 등록하기

      int result2 = 0;

      for(ChDetailInfo chDetailInfo : chDetailInfoList) {
        chDetailInfo.setChConNo(chConNo);
        chDetailInfo.setChNo(chNo);

        log.info("디테일 객체 하나 : " + chDetailInfo);
        result2 = confirmService.insertDetailInfo(chDetailInfo);
      }
      return result2;
    } else {
      return result1;
    }
  }

}
