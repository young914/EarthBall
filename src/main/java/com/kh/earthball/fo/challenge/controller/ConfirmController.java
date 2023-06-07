package com.kh.earthball.fo.challenge.controller;

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
import com.kh.earthball.fo.challenge.vo.ChDetailInfoParam;
import com.kh.earthball.fo.challenge.vo.Challenge;
import com.kh.earthball.fo.common.template.Pagination;
import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
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
  public String confirmInsertForm(@RequestParam(value = "chNo") int chNo, Model model) {

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
    if (result1 > 0) { // 기본정보 등록 성공이면 디테일 내용 등록하기

      int result2 = 0;

      for (ChDetailInfo chDetailInfo : chDetailInfoList) {
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

  @GetMapping("listView.con")
  public String confirmListView(int chNo, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {

    // 해당 챌린지의 인증 게시글 수 조회
    int listCount = confirmService.selectListCount(chNo);

    int pageLimit = 5;
    int boardLimit = 10;

    PageInfo pageInfo = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

    List<ChConfirm> chConfirms = confirmService.selectConfirmList(pageInfo, chNo);

    Challenge challenge = challengeService.selectChallenge(chNo);

    model.addAttribute("pageInfo", pageInfo);
    model.addAttribute("chConfirms", chConfirms);
    model.addAttribute("challenge", challenge);

    return "fo/challenge/confirm/confirmListView";
  }

  @GetMapping("detailView.con")
  public String confirmDetailView(int chConNo, Model model) {

    // 해당하는 챌린지 인증 게시글 조회 해오기
    ChConfirm chConfirm = confirmService.selectConfirm(chConNo);

    // 챌린지 인증의 해당하는 챌린지 정보 조회해오기
    int chNo = chConfirm.getChNo();
    log.info("너의 번호가 뭐니 : " + chNo);

    Challenge challenge = challengeService.selectChallenge(chNo);
    log.info("해당 챌린지 나와라 : " + challenge);

    /*-------------------*/

    int categoryNo = challenge.getCategoryNo();

    log.info("카테고리 번호 나와 : " + categoryNo);

    // 해당 챌린지의 카테고리번호를 가지고 인증 폼 가져오기
    List<CategoryTemplate> templateList = templateService.selectTemplateList(categoryNo);

    for (CategoryTemplate categoryTemplate : templateList) {
      log.info("CategoryTemplateNo 넘어왔어? : " + categoryTemplate.getCategoryTemplateNo());
      if (categoryTemplate.getCategoryTemplateNo() != 0) {
        int categoryTemplateNo = categoryTemplate.getCategoryTemplateNo();

        ChDetailInfoParam detailInfoParam = ChDetailInfoParam.builder()
            .chNo(chNo)
            .chConNo(chConNo)
            .categoryTemplateNo(categoryTemplateNo)
            .build();

        List<ChDetailInfo> chDetailInfoList = confirmService.selectDetailInfoList(detailInfoParam);
        categoryTemplate.setChDetailInfoList(chDetailInfoList);
      }

      log.info("grp 넘어왔어? : " + categoryTemplate.getGrpCode());
      if (StringUtils.isNotEmpty(categoryTemplate.getGrpCode())) {
        List<Code> codeList = codeService.selectCodeList(categoryTemplate.getGrpCode());
        categoryTemplate.setCodeList(codeList);
      }

      log.info("templateList에 들어있는 값 1 : " + templateList);   // 아직 code에 checked => true 부여 못한 상태!!!!!!


      if(categoryTemplate.getCodeList() != null && categoryTemplate.getCodeList().isEmpty()) { // 코드 리스트가 있다면 => select / checkbox / radio 라면

        List<Code> codeList = categoryTemplate.getCodeList();
        List<ChDetailInfo> chDetailInfoList = categoryTemplate.getChDetailInfoList();

        for(Code code : codeList) {
          String codeOne = code.getCode();

          for(ChDetailInfo chDetailInfo : chDetailInfoList) {
            if(codeOne.equals(chDetailInfo.getCode())) {
              code.setChecked("true");
            }
          }
        }
      }


    }

    log.info("templateList에 들어있는 값 2 : " + templateList);   // code에 checked => true 부여 된 상태!!!!!!



    model.addAttribute("templateList", templateList);
    model.addAttribute("chConfirm", chConfirm);
    model.addAttribute("challenge", challenge);


    return "fo/challenge/confirm/confirmDetailView";
  }

}
