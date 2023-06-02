package com.kh.earthball.bo.challenge.controller;

import com.kh.earthball.bo.challenge.service.CodeService;
import com.kh.earthball.bo.challenge.vo.Code;
import com.kh.earthball.bo.challenge.vo.GrpCode;
import com.kh.earthball.fo.common.vo.PageInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class CodeController {

  private final CodeService codeService;

  @GetMapping("grpCodeForm")
  public String insertGrpForm() {
    return "bo/challenge/code/grpCodeEnrollForm_1";
  }

  @ResponseBody
  @PostMapping("insert.grp")
  public int insertGrp(GrpCode grpCode) {
    return codeService.insertGrp(grpCode);
  }

  @GetMapping("list.grp")
  public String grpList(Model model, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {

    int listCount = codeService.selectListCount();
    int pageLimit = 10;
    int boardLimit = 10;

    int maxPage = (int) Math.ceil((double) listCount / boardLimit);
    int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
    int endPage = startPage + pageLimit - 1;

    if (endPage > maxPage) {
      endPage = maxPage;
    }

    PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

    List<GrpCode> grpCodeList = codeService.selectList(pi);

    log.info("grpCodeList : " + grpCodeList);

    model.addAttribute("pi", pi);
    model.addAttribute("grpCodeList", grpCodeList);

    return "bo/challenge/code/grpCodeListView_2";
  }

  @GetMapping("updateForm.grp")
  public String updateGrpForm(@RequestParam(value = "grpCode") String grpCode, Model model) {

    GrpCode grpCodeInfo = codeService.selectGrp(grpCode);

    model.addAttribute("grpCode", grpCodeInfo);

    return "bo/challenge/code/grpCodeUpdateForm_1";
  }

  @ResponseBody
  @PostMapping("update.grp")
  public int updateGrp(GrpCode grpCode) {
    return codeService.updateGrp(grpCode);
  }


  @GetMapping("deleteForm.grp")
  public String deleteGrp(Model model, @RequestParam(value = "code") String code, HttpServletRequest request) {
    int result = codeService.deleteGrp(code);

    if (result > 0) {  // 성공
      this.grpList(model, 1);
      return "bo/challenge/code/grpCodeListView";
    } else {  // 실패
      String referer = request.getHeader("Referer");
      return "redirect:" + referer;
    }
  }

  @GetMapping("codeEnrollForm")
  public String codeEnrollForm(String grpCode, Model model) {
//		log.info("grpCode 들어왔니? : " + grpCode);

    GrpCode grp = codeService.selectGrp(grpCode);

    model.addAttribute("grp", grp);

    return "bo/challenge/code/codeEnrollForm";
  }

  @ResponseBody
  @PostMapping("insert.code")
  public int insertCode(Code code) {
//		log.info("Code : " + code);
    int result = codeService.insertCode(code);
//		log.info("result : " + result);
    return result;
  }

  @GetMapping("list.code")
  public String selectListCode(Model model, @RequestParam(value = "grpCode") String grpCode) {

    List<Code> codeList = codeService.selectCodeList(grpCode);

    model.addAttribute("codeList", codeList);

    return "bo/challenge/code/codeListView_1";
  }

  @GetMapping("updateForm.code")
  public String codeUpdateForm(@RequestParam(value = "grpCode") String grpCode, @RequestParam(value = "code") String code, Model model) {

    log.info("값 들어옴? : " + grpCode + code);

    // 코드 정보 조회해와야지
    Code selectCode = codeService.selectCode(grpCode, code);
    GrpCode selectGrp = codeService.selectGrp(grpCode);

    model.addAttribute("code", selectCode);
    model.addAttribute("grp", selectGrp);

    return "bo/challenge/code/codeUpdateForm";
  }

  @ResponseBody
  @PostMapping("update.code")
  public int updateCode(Code code) {

    log.info("업데이트 코드 들어와라 : " + code);

    int result = codeService.updateCode(code);

    log.info("업데이트 결과 : " + result);

    return result;
  }


  @ResponseBody
  @PostMapping("delete.code")
  public int deleteCode(String grpCode, String code) {
    int result = codeService.deleteCode(grpCode, code);

    log.info("삭제 result 값 : " + result);

    return result;
  }

}
